unit data_module;

interface

uses
  System.SysUtils, System.Classes, Data.DB, IBX.IBCustomDataSet, IBX.IBTable,
  IBX.IBDatabase, Datasnap.Provider, IBX.IBStoredProc, IBX.IBQuery, User_class,
  common_db;

type
  Tdm = class(TDataModule)
    Torders: TIBTable;
    TWorkers: TIBTable;
    spEDIT_ORDER_SET_DRIVER: TIBStoredProc;
    spAdd_order: TIBStoredProc;
    TVehicle: TIBTable;
    TNew_day_car_delivery: TIBTable;
    QDriver_id_from_vehicle_day: TIBQuery;
    spBegin_day_driver: TIBStoredProc;
    spLogin: TIBStoredProc;
    QDrivers: TIBQuery;
    QManagers: TIBQuery;
    QOperators: TIBQuery;
    QCustomers: TIBQuery;
    TAddress_In: TIBTable;
    TAddress_Out: TIBTable;
    QCustomer_By_Id: TIBQuery;
    QCar_By_Id: TIBQuery;
    QOrder_By_Id: TIBQuery;
    QAddress_By_Id: TIBQuery;
    spEdit_Order_Status: TIBStoredProc;
    QWorker_By_Id: TIBQuery;
    QLogin_By_Id: TIBQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  user : TUser;
  procedure open_all;
  function get_name_customer_by_id(id:integer):string;
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure Tdm.DataModuleCreate(Sender: TObject);
begin
  //open_all;
end;

procedure  Tdm.open_all;
begin
  dm.TOrders.Open;
  dm.TWorkers.Open;
  dm.TVehicle.Open;
  dm.TNew_day_car_delivery.Open;
  dm.TAddress_In.Open;
  dm.TAddress_Out.Open;


   dm.Qdrivers.Close;
   dm.QDrivers.Open;
   dm.QManagers.Close;
   dm.QManagers.Open;
   dm.QOperators.Close;
   dm.QOperators.Open;
   dm.QCustomers.Close;
   dm.QCustomers.Open;

  with   dm.QDriver_id_from_vehicle_day do begin
    ParamByName('IN_DATE').Value := now;
    ParamByName('IN_ID_VEHICLE').Value := 0;
    open;
  end;


end;

function Tdm.get_name_customer_by_id(id:integer):string;
begin
  with dm.QCustomer_By_Id do begin
    ParamByName('ID_CUSTOMER').Value := id;
    open;
  end;
  get_name_customer_by_id := dm.QCustomer_By_Id.FieldByName('SURNAME').Value;
  dm.QCustomer_By_Id.Close;
end;

end.
