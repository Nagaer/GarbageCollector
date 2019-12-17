unit common_db;

interface

uses
  System.SysUtils, System.Classes, Data.DB, IBX.IBDatabase;

type
  Tdm_db = class(TDataModule)
    IBDatabase_read: TIBDatabase;
    IBTransaction_read: TIBTransaction;
    IBTransaction_edit: TIBTransaction;
    IBDatabase_edit: TIBDatabase;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure edit_host(host_name:string;fbd_path: string);
  end;

var
  dm_db: Tdm_db;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}
procedure Tdm_db.edit_host(host_name:string;fbd_path: string);
begin
  with  IBDatabase_read do begin
      close;
      DatabaseName := host_name + ':' + fbd_path;
      Open;
  end;
  with  IBDatabase_edit do begin
      close;
      DatabaseName := host_name + ':' + fbd_path;
      Open;
  end;

end;

end.
