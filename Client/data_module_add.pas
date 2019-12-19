unit data_module_add;

interface

uses
  System.SysUtils, System.Classes, Data.DB, IBX.IBCustomDataSet,
  IBX.IBStoredProc, IBX.IBDatabase, common_db;

type
  Tdm_add = class(TDataModule)
    spAdd_Car: TIBStoredProc;
    spEdit_Car: TIBStoredProc;
    spEdit_Worker: TIBStoredProc;
    spAdd_Address: TIBStoredProc;
    spAdd_Order: TIBStoredProc;
    spAdd_Customer: TIBStoredProc;
    spAdd_Worker: TIBStoredProc;
  private
    { Private declarations }
  public
    procedure add_car(mark:string; number:string; model:string);
    procedure edit_car(id:integer; mark:string; number:string; model:string);
    procedure add_worker(role_:integer; experience:integer; dob:tdatetime; worker_name:string; worker_surname:string; worker_login:string; worker_password:string);
    procedure edit_worker(id:integer; status:integer; role_:integer; experience:integer; dob:tdatetime; worker_name:string; worker_surname:string; worker_login:string; worker_password:string);
    procedure add_order(customer_id:integer; weight:integer; from_id:integer; to_id:integer; delivery:tdatetime; operator_id:integer; num_stevedore:integer; price:integer);
    procedure add_customer(customer_name:string; customer_surname:string; address_id:integer; phone:string);
    procedure add_address(city:string; street:string; number:integer; floor:integer);
  end;

var
  dm_add: Tdm_add;

implementation
{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure Tdm_add.add_car(mark:string; number:string; model:string);
begin
 with dm_add.spAdd_Car do
 begin

   ParamByName('MARKA').Value := mark;
   ParamByName('NUMBER').Value:= number;
   ParamByName('MODEL').Value:= model;

 // Execute the procedure
 if not Transaction.InTransaction then
   Transaction.StartTransaction;
 ExecProc;
 Transaction.Commit;
 end;
end;

procedure Tdm_add.edit_car(id:integer; mark:string; number:string; model:string);
begin
  with dm_add.spEdit_Car do
  begin

   ParamByName('ID').AsInteger := id;
   ParamByName('MARKA').Value := mark;
   ParamByName('NUMBER').Value:= number;
   ParamByName('MODEL').Value:= model;

  // Execute the procedure
  if not Transaction.InTransaction then
    Transaction.StartTransaction;
  ExecProc;
  Transaction.Commit;
  end;
end;

procedure Tdm_add.add_worker(role_:integer; experience:integer; dob:tdatetime;
                             worker_name:string; worker_surname:string;
                             worker_login:string; worker_password:string);
begin
with dm_add.spAdd_Worker do
  begin

  ParamByName('ROLE_').AsInteger := role_;
  ParamByName('EXPERIENCE').AsInteger := experience;
  ParamByName('DOB').AsDate:= dob;
  ParamByName('NAME').Value:= worker_name;
  ParamByName('SURNAME').Value:= worker_surname;
  ParamByName('LOGIN').Value:= worker_login;
  ParamByName('PASSWORD_').Value:= worker_password;

  // Execute the procedure
  if not Transaction.InTransaction then
    Transaction.StartTransaction;
  ExecProc;
  Transaction.Commit;
  end;
end;

procedure Tdm_add.edit_worker(id:integer; status:integer; role_:integer;
      experience:integer; dob:tdatetime; worker_name:string; worker_surname:string;
                             worker_login:string; worker_password:string);
begin
with dm_add.spEdit_Worker do
  begin

  ParamByName('ID').AsInteger := id;
  ParamByName('STATUS').AsInteger := status;
  ParamByName('ROLE_').AsInteger := role_;
  ParamByName('EXPERIENCE').AsInteger := experience;
  ParamByName('DOB').AsDate:= dob;
  ParamByName('NAME').Value:= worker_name;
  ParamByName('SURNAME').Value:= worker_surname;
  ParamByName('LOGIN').Value:= worker_login;
  ParamByName('PASSWORD_').Value:= worker_password;

  // Execute the procedure
  if not Transaction.InTransaction then
    Transaction.StartTransaction;
  ExecProc;
  Transaction.Commit;
  end;
end;


procedure Tdm_add.add_order(customer_id:integer; weight:integer; from_id:integer;
        to_id:integer; delivery:tdatetime; operator_id:integer;
        num_stevedore:integer; price:integer);
begin
with dm_add.spAdd_Order do
  begin

  ParamByName('ID_CUSTOMER').AsInteger := customer_id;
  ParamByName('WEIGHT').AsInteger := weight;
  ParamByName('FROM_ID_ADDREESS').AsInteger := from_id;
  ParamByName('TO_ID_ADDRESS').AsInteger := to_id;
  ParamByName('DATE_OF_DELIVERY').AsDate:= delivery;
  //ParamByName('WHO_DRIVER').AsInteger := null;
  ParamByName('ID_OPERATOR').AsInteger := operator_id;
  ParamByName('NUMBER_STEVEDORE').AsInteger := num_stevedore;
  ParamByName('PRICE').AsInteger := price;
  //ParamByName('STATUS').AsInteger := 0;
  //ParamByName('DATE_ORDER_COMPLETION').AsDate:= null;
  //ParamByName('DATE_ORDER_CANCELLATION').AsDate:= null;

  // Execute the procedure
  if not Transaction.InTransaction then
    Transaction.StartTransaction;
  ExecProc;
  Transaction.Commit;
  end;
end;


procedure Tdm_add.add_customer(customer_name:string; customer_surname:string;
                               address_id:integer; phone:string);
begin
with dm_add.spAdd_Customer do
  begin

  ParamByName('NAME').Value:= customer_name;
  ParamByName('SURNAME').Value:= customer_surname;
  ParamByName('ID_ADDRESS').AsInteger := address_id;
  ParamByName('PHONE_NUMBER').Value:= phone;

  // Execute the procedure
  if not Transaction.InTransaction then
    Transaction.StartTransaction;
  ExecProc;
  Transaction.Commit;
  end;
end;

procedure Tdm_add.add_address(city:string; street:string;
                               number:integer; floor:integer);
begin
with dm_add.spAdd_Address do
  begin

  ParamByName('CITY').Value:= city;
  ParamByName('STREET').Value:= street;
  ParamByName('NUMBER_HOUSE').AsInteger := number;
  ParamByName('FLOOR_').AsInteger:= floor;

  // Execute the procedure
  if not Transaction.InTransaction then
    Transaction.StartTransaction;
  ExecProc;
  Transaction.Commit;
  end;
end;

end.
