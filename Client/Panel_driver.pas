unit Panel_driver;

interface
uses  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdBaseComponent, IdComponent, IdUDPBase,
  IdUDPClient, IdUDPServer, IdGlobal, IdSocketHandle, generics.collections, order_interface,data_module
  ,order_class, Vcl.StdCtrls,IBX.IBTable, driver_class,driver_interface,
  Vcl.ExtCtrls,Panel_vehicle,vehicle_class,vehicle_interface,statuses,colored_panel_class,
  details_worker_window, panel_order, Generics.Defaults;


type TPanel_driver = Class(TPanel,TDriver_Interface,IInterface)
  Panel_info: TColoredPanel;
  Panel_queue : TColoredPanel;

  private
  driver : TDriver;
  const maxOrdersCount = 5;
  procedure put_details;

  // from interface
  public
  function get_id : integer;
  function get_status : integer;
  procedure update_driver(updated_driver : TDriver);
  procedure destroy_from_interface;
  procedure doubleClick(Sender : TObject);

  procedure redraw;
  function get_queue : TPanel;
  constructor Create(AOwner: TComponent;Pdriver : TDriver;PdragOver :TDragOverEvent; PdragDrop : TDragDropEvent);
  destructor Destroy; override;
End;

implementation

// From iterface---------------------------------
function TPanel_driver.get_id : integer;
begin
     get_id := driver.get_id;
end;

function TPanel_driver.get_status;
begin
  get_status := driver.get_status;
end;

procedure TPanel_driver.update_driver(updated_driver : TDriver);
begin
  driver.Destroy;
  driver := updated_driver;
  put_details;
end;

procedure  TPanel_driver.destroy_from_interface;
begin
  destroy;
end;


// end From iterface---------------------------------

procedure TPanel_driver.put_details;
begin
     panel_info.caption := driver.get_name + ' ' + driver.get_surname[1] + '.';
     panel_info.Color := RGB(0, 191, 255); //DeepSkyBlue (Blue)
end;


function TPanel_driver.get_queue : TPanel;
begin
  get_queue := panel_queue;
end;

procedure TPanel_driver.redraw;
var
  i : integer;
  //sortedArray : TList<TControl>;
  //comparer : TListSortCompare;
begin
    with panel_queue do
    //sortedArray :=  TList<TControl>.create;
    //for i := 0 to ControlCount - 1 do begin
   //   sortedArray.add(controls[i]);
   // end;
    // sort
     // comparer :=  TListSortCompare
     // TList<TControl>.sort(sortedArray, TDelegatedComparer<TControl>.Construct(
     // function(const Left, Right: TControl): Integer
     //  begin
     //   Result := (Left as TPanel_order).get_date_delivery <
     //             (Right as TPanel_order).get_date_delivery;
     //  end));

      for i := 0 to ControlCount - 1 do begin
        controls[i].Top := 0;
        if ControlCount < maxOrdersCount then begin
          controls[i].Width := trunc((screen.Width * 0.7 - 80) * 0.9 / ControlCount);
        end
        else begin
          controls[i].Width := trunc((screen.Width * 0.7 - 110) / ControlCount);
        end;
        controls[i].Left := controls[i].Width * i;

      end;
end;

constructor TPanel_driver.Create(AOwner: TComponent;Pdriver : TDriver;PdragOver :TDragOverEvent; PdragDrop : TDragDropEvent );
var
  p_info_width, p_queue_width : Integer;
begin
  inherited Create(AOwner);
  driver := Pdriver;


  p_info_width := 80;
  p_queue_width := trunc(screen.Width*0.7-p_info_width);

  width := p_info_width + p_queue_width;
  // Setup info panel
  panel_info := TColoredPanel.Create(self);
  with panel_info do begin
    Parent := self;
    Top := 0;
    Left := 0;
    width := p_info_width;
    height := 40;
    visible := true;

    ondblClick := doubleClick;

  end;


  panel_queue := TColoredPanel.Create(self);
  with panel_queue do begin
    Parent := self;
    Top := 0;
    Left := 80;
    width := p_queue_width;
    height := 40;
    visible := true;

    OndragOver :=  PdragOver;
    OndragDrop := PdragDrop;
  end;

  // Put here order details
  put_details;
end;

destructor TPanel_driver.Destroy;
begin
  driver.Destroy;
  parent := nil;
  panel_info.Free;
  panel_queue.Free;
  inherited;
end;

procedure   TPanel_driver.doubleClick(Sender: TObject);
begin
  form_Details_Worker := Tform_Details_Worker.Create(Application);
  form_Details_Worker.id_worker := driver.get_id;
  form_Details_Worker.showmodal;
end;
end.
