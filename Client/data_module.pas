unit data_module;

interface

uses
  System.SysUtils, System.Classes, Data.DB, IBX.IBCustomDataSet, IBX.IBTable,
  IBX.IBDatabase, Datasnap.Provider, IBX.IBStoredProc, IBX.IBQuery, User_class;

type
  Tdm = class(TDataModule)
    IBDatabase1: TIBDatabase;
    IBTransaction_read: TIBTransaction;
    Torders: TIBTable;
    TDrivers: TIBTable;
    spEDIT_ORDER_SET_DRIVER: TIBStoredProc;
    spAdd_order: TIBStoredProc;
    TVehicle: TIBTable;
    TNew_day_car_delivery: TIBTable;
    QDriver_id_from_vehicle_day: TIBQuery;
    spBegin_day_driver: TIBStoredProc;
    spLogin: TIBStoredProc;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  user : TUser;
  procedure open_all;
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure Tdm.DataModuleCreate(Sender: TObject);
begin
  open_all;
end;

procedure  Tdm.open_all;
begin
  dm.TOrders.Open;
  dm.TDrivers.Open;
  dm.TVehicle.Open;
  dm.TNew_day_car_delivery.Open;

  with   dm.QDriver_id_from_vehicle_day do begin
    ParamByName('IN_DATE').Value := now;
    ParamByName('IN_ID_VEHICLE').Value := 0;
    open;
  end;


end;

end.
