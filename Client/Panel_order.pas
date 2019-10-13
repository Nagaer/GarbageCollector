unit Panel_order;

interface
 uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, IBX.IBTable, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, order_class,order_interface;

type TPanel_order = Class(TPanel,TOrder_Interface,IInterface)
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


  function get_driver_id : integer;


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
begin
     caption := 'id: '+ intTostr(order.get_id) + ' st: ' + intTostr(order.get_status)
     + ' Dr id' + intToStr(order.get_driver_id);
end;


function TPanel_order.get_driver_id : integer;
begin
  get_driver_id :=  order.get_driver_id;
end;



constructor TPanel_order.Create(AOwner: TComponent;Porder : TOrder);
begin
  inherited Create(AOwner);
  order := Porder;

  dragMode :=  dmAutomatic;
  //onDragOver :=

  // Put here order details
  put_details;
end;

destructor TPanel_order.Destroy;
begin
  order.Destroy;
  parent := nil;
  inherited;
end;


end.
