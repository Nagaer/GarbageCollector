unit data_module;

interface

uses
  System.SysUtils, System.Classes, Data.DB, IBX.IBCustomDataSet, IBX.IBTable,
  IBX.IBDatabase, Datasnap.Provider, IBX.IBStoredProc;

type
  Tdm = class(TDataModule)
    IBDatabase1: TIBDatabase;
    IBTransaction_read: TIBTransaction;
    Torders: TIBTable;
    TDrivers: TIBTable;
    spEDIT_ORDER_SET_DRIVER: TIBStoredProc;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
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
end;

end.
