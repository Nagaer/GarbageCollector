unit Panel_driver;

interface
uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, driver_class,driver_interface;


type TPanel_driver = Class(TPanel,TDriver_Interface,IInterface)
  Panel_info: TPanel;
  Panel_queue : TPanel;

  private
  driver : TDriver;
  procedure put_details;

  // from interface
  public
  function get_id : integer;
  function get_status : integer;
  procedure update_driver(updated_driver : TDriver);
  procedure destroy_from_interface;


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
     panel_info.caption := 'id: '+ intTostr(driver.get_id) + ' status: ' + intTostr(driver.get_status);
end;


function TPanel_driver.get_queue : TPanel;
begin
  get_queue := panel_queue;
end;

procedure TPanel_driver.redraw;
var
  i : integer;
begin
    with panel_queue  do
      for I := 0 to ControlCount - 1 do begin
        controls[i].Top := 0;
        controls[i].Left := controls[i].Width * I;
      end;
end;

constructor TPanel_driver.Create(AOwner: TComponent;Pdriver : TDriver;PdragOver :TDragOverEvent; PdragDrop : TDragDropEvent );
var
  p_info_width, p_queue_width : Integer;
begin
  inherited Create(AOwner);
  driver := Pdriver;


  p_info_width := 80;
  p_queue_width := 500;

  width := p_info_width + p_queue_width;
  // Setup info panel
  panel_info := TPanel.Create(self);
  with panel_info do begin
    Parent := self;
    Top := 0;
    Left := 0;
    width := p_info_width;
    height := 40;
    visible := true;
  end;


  panel_queue := TPanel.Create(self);
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

end.