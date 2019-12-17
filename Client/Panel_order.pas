unit Panel_order;

interface
 uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, IBX.IBTable, Vcl.Forms, Vcl.Dialogs, colored_panel_class,Vcl.StdCtrls,
  Vcl.ExtCtrls, order_class,order_interface, details_order_window;

type TPanel_order = Class(TColoredPanel,TOrder_Interface,IInterface)
  private
  order : TOrder;
  procedure put_details;

  // from interface
  public
  function get_id : integer;
  function get_status : integer;

  procedure update_order(updated_order : TOrder);
  procedure destroy_from_interface;
  procedure set_driver(id_driver: integer);

  procedure MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

  procedure doubleClick(Sender : TObject);



  function get_driver_id : integer;
  function get_date_delivery : tdatetime;


  constructor Create(AOwner: TComponent;Porder : TOrder);
  destructor Destroy; override;
End;

implementation

// From iterface---------------------------------
function TPanel_order.get_id : integer;
begin
     get_id := order.get_id;
end;

function TPanel_order.get_status;
begin
  get_status := order.get_status;
end;

function TPanel_order.get_date_delivery;
begin
  get_date_delivery := order.get_date_delivery;
end;

procedure TPanel_order.update_order(updated_order : TOrder);
begin
  order.Destroy;
  order := updated_order;
  put_details;
end;

procedure  TPanel_order.destroy_from_interface;
begin
  destroy;
end;

procedure TPanel_order.set_driver(id_driver : Integer);
begin
    order.update_driver(id_driver);
    put_details;
end;
// end From iterface---------------------------------

procedure TPanel_order.put_details;
var dod:string;
    d_length:integer;
begin
     dod := DateTimeToStr(order.get_date_delivery);
     d_length := length(dod);
     //dod := copy(dod, 2, d_length-1);
     dod := copy(dod, 1, d_length-3);
     caption := order.get_customer + ' ' + dod;
     if (order.get_status = 0) then begin
         color := RGB(102, 205, 170); //LawnGreen (Green)
     end
     else if (order.get_status = 2) then begin
          color := RGB(240, 230, 140); //Khaki (Yellow)
     end
     else if (order.get_status = 3) then begin
          color := RGB(250, 128, 114); //Salmon (Red)
     end
     else if (order.get_status = 4) then begin
          color := RGB(220, 20, 60); //Crimson (Red)
     end
     else if (order.get_status = 5) then begin
          color := RGB(139, 0, 0); //DarkRed
     end
     else if (order.get_status = 6) then begin
         color := RGB(238, 130, 238); //Violet (Purple)
     end
     else begin
         color := clPurple;
     end;
end;


function TPanel_order.get_driver_id : integer;
begin
  get_driver_id :=  order.get_driver_id;
end;



constructor TPanel_order.Create(AOwner: TComponent;Porder : TOrder);
begin
  inherited Create(AOwner);
  order := Porder;

  dragMode :=  dmManual;
  onMousedown :=  mouseDown;
  ondblClick := doubleClick;

  // Put here order details
  put_details;
end;

destructor TPanel_order.Destroy;
begin
  order.Destroy;
  parent := nil;
  inherited;
end;

procedure TPanel_order.MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X: Integer; Y: Integer);
begin
  if (Button = mbLeft) then
    (Sender as TColoredPanel).BeginDrag(false);

end;

procedure TPanel_order.doubleClick(Sender: TObject);
begin
  form_Details_Order := Tform_Details_Order.Create(Application);
  form_Details_Order.id_order := order.get_id;
  form_Details_Order.showmodal;
  getParentForm(self).Update;
end;


end.
