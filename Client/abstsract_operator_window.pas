unit abstsract_operator_window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdBaseComponent, IdComponent, IdUDPBase,
  IdUDPClient, IdUDPServer, IdGlobal, IdSocketHandle, generics.collections, order_interface,data_module
  ,order_class, Vcl.StdCtrls,IBX.IBTable, driver_class,driver_interface,panel_driver,
  Vcl.ExtCtrls,Panel_vehicle,vehicle_class,vehicle_interface,statuses;
 const
  ignore_status = [status_done,status_cancel,9];
type
  TElem = (Order,Vehicle,Driver);
  TForm_abstract_operator = class(TForm)
    IdUDPServer1: TIdUDPServer;
    procedure IdUDPServer1UDPRead(AThread: TIdUDPListenerThread;
      const AData: TIdBytes; ABinding: TIdSocketHandle);
    procedure PanelDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);virtual;abstract;
    procedure PanelDragDrop(Sender, Source: TObject; X, Y: Integer);virtual;abstract;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  protected
    order_list : TList<TOrder_Interface>;
    driver_list : TList<TDriver_interface>;
    vehicle_list : TList<TVehicle_interface>;
    driver_updatable: boolean;
    vehicle_updatable: boolean;
    order_updatable: boolean;
    procedure update_orders;
    procedure update_drivers;
    procedure update_vehicles(date : TDate);

    procedure add(Porder:TOrder);overload;virtual;abstract;
    procedure add(PDriver:TDriver);overload;virtual;abstract;
    procedure add(PDriver:Tvehicle);overload;virtual;abstract;
    procedure update_interface(elem : TElem);virtual;abstract;

  private
    { Private declarations }
    //procedure test_update_orders(Table : TibTable; List, queue : TList
  public
    { Public declarations }
  constructor Create(AOwner: TComponent); override;
  end;

var
  Form_abstract_operator: TForm_abstract_operator;

implementation

{$R *.dfm}

procedure TForm_abstract_operator.update_orders;
var i,j,count : integer;
   new_order : TOrder;
   queue : TList<TOrder_Interface>;
begin
    // Refresh table
    dm.TOrders.Refresh;

    // Get count
    dm.TOrders.Last;
    count := dm.TOrders.RecordCount;
    dm.TOrders.First;

    // Copy TList to queue
    queue := TList<TOrder_Interface>.Create;
    queue.InsertRange(0,order_list);

    for  i := 0 to count - 1 do    begin
      if dm.TOrders.FieldByName('STATUS').AsInteger in ignore_status  then begin
        dm.TOrders.Next;
        continue;
      end;


      j:=0;
      while ( j < queue.Count) and ( queue[j].get_id  <> dm.TOrders.FieldByName('ID').AsInteger )  do
         j := j+1;
      // if found order but status changed
      if (j < queue.Count) then begin
          //if  (dm.TOrders.FieldByName('STATUS').AsInteger <> queue[j].get_status ) then begin
             new_order := TOrder.Create(dm.TOrders);
             queue[j].update_order(new_order);
          //end;

          queue.Delete(j);
      end
      else begin// Order not found
      // add it to list
      //Create new order
        New_Order := TOrder.Create(dm.TOrders);
        add(New_order);
      end;
      // end add order in list

      dm.TOrders.Next;
    end;

    // Delete orders wich not found in db

    for i := 0 to queue.Count - 1 do begin
      order_list.Remove(queue[i]);
      queue[i].destroy_from_interface;
    end;


    queue.Destroy;
    update_interface(order);
end;

procedure TForm_abstract_operator.update_drivers;
// Just the same code as update_orders :(
var i,j,count : integer;
   new_driver : TDriver;
   queue : TList<TDriver_interface>;
begin
    // Refresh table
    dm.Qdrivers.Close;
    dm.QDrivers.Open;

    // Get count
    dm.Qdrivers.Last;
    count := dm.Qdrivers.RecordCount;
    dm.Qdrivers.First;

    // Copy TList to queue
    queue := TList<TDriver_interface>.Create;
    queue.InsertRange(0,driver_list);

    for  i := 0 to count - 1 do    begin

      j:=0;
      while ( j < queue.Count) and ( queue[j].get_id  <> dm.Qdrivers.FieldByName('ID').AsInteger )  do
         j := j+1;
      // if found order but status changed
      if (j < queue.Count) then begin
          //if  (dm.TDrivers.FieldByName('STATUS').AsInteger <> queue[j].get_status ) then begin
             new_driver := TDriver.Create(dm.Qdrivers);
             queue[j].update_driver(new_driver);
          //end;

          queue.Delete(j);
      end
      else begin// Order not found
      // add it to list
      //Create new order
        New_driver := TDriver.Create(dm.QDrivers);
        add(New_driver);
      end;
      // end add order in list

      dm.Qdrivers.Next;
    end;

    // Delete orders wich not found in db

    for i := 0 to queue.Count - 1 do begin
      driver_list.Remove(queue[i]);
      queue[i].destroy_from_interface;
    end;


    queue.Destroy;
    update_interface(driver);
end;

procedure TForm_abstract_operator.update_vehicles(date : TDate);
var i,j,count : integer;
   new_vehicle : Tvehicle;
   queue : TList<Tvehicle_Interface>;
   id_driver : integer;
begin
    // Refresh table
    dm.Tvehicle.Refresh;

    // Get count
    dm.Tvehicle.Last;
    count := dm.Tvehicle.RecordCount;
    dm.Tvehicle.First;

    // Copy TList to queue
    queue := TList<Tvehicle_Interface>.Create;
    queue.InsertRange(0,vehicle_list);


    for  i := 0 to count - 1 do    begin

      //  DB request to obtain driver info
      // Date is setted
      with  dm.QDriver_id_from_vehicle_day do begin
        ParamByName('IN_ID_VEHICLE').Value :=
        dm.Tvehicle.FieldByName('ID').AsInteger;
        ParamByName('IN_DATE').Value := date;
        //ParamByName('IN_DATE').Value := now;
        close;
        open;
      end;
      if VarIsNull(dm.QDriver_id_from_vehicle_day.FieldByName('ID_DRIVER').Value) then
        id_driver := 0
      else
        id_driver :=  dm.QDriver_id_from_vehicle_day.FieldByName('ID_DRIVER').Value;

      j:=0;
      while ( j < queue.Count) and ( queue[j].get_id  <> dm.Tvehicle.FieldByName('ID').AsInteger )  do
         j := j+1;
      // if found order but status changed
      if (j < queue.Count) then begin

          //if  (dm.Tvehicle.FieldByName('STATUS').AsInteger <> queue[j].get_status ) then begin
             new_vehicle := Tvehicle.Create(dm.Tvehicle,id_driver,date);
             queue[j].update_vehicle(new_vehicle);
          //end;

          queue.Delete(j);
      end
      else begin// Order not found
      // add it to list
      //Create new order
        New_vehicle := Tvehicle.Create(dm.Tvehicle,id_driver,date);
        add(New_vehicle);
      end;
      // end add order in list

      dm.Tvehicle.Next;
    end;

    // Delete orders wich not found in db

    for i := 0 to queue.Count - 1 do begin
      vehicle_list.Remove(queue[i]);
      queue[i].destroy_from_interface;
    end;


    queue.Destroy;
    update_interface(vehicle);
end;

procedure TForm_abstract_operator.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IdUDPServer1.Active := false;
end;

procedure TForm_abstract_operator.FormCreate(Sender: TObject);
begin
  IdUDPServer1.Active := true;
end;

procedure TForm_abstract_operator.IdUDPServer1UDPRead(
  AThread: TIdUDPListenerThread; const AData: TIdBytes;
  ABinding: TIdSocketHandle);
  var
    recieve : string;
begin
  recieve := bytesToString(AData);
  case recieve[1] of
  '1' : if order_updatable then
        update_orders;

  '2' : if driver_updatable  then
          update_drivers;
  '3' : if vehicle_updatable then
          update_vehicles(now);
  end;
end;




constructor TForm_abstract_operator.Create(AOwner: TComponent);
begin
  inherited;
  order_list :=  TList<TOrder_Interface>.create;
  driver_list := TList<TDriver_interface>.create;
  vehicle_list := TList<TVehicle_interface>.create;
  driver_updatable := false;
  vehicle_updatable := false;
  order_updatable := false;
end;

end.
