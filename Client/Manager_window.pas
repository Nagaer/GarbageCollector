unit Manager_window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, user_class, data_module_add,
  Data.DB, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, data_module ;

type
  TForm_manager = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    menu_diver: TMenuItem;
    menu_operator: TMenuItem;
    menu_manager: TMenuItem;
    menu_distr_cars: TMenuItem;
    menu_orders: TMenuItem;
    menu_car: TMenuItem;
    DBGrid_drivers: TDBGrid;
    Label_drivers: TLabel;
    DataSource_drivers: TDataSource;
    menu_update: TMenuItem;
    menu_edit: TMenuItem;
    menu_edit_car: TMenuItem;
    DBGrid_cars: TDBGrid;
    DataSource_cars: TDataSource;
    menu_edit_driver: TMenuItem;
    DBGrid_managers: TDBGrid;
    DBGrid_operators: TDBGrid;
    DataSource_managers: TDataSource;
    DataSource_operators: TDataSource;
    menu_edit_operator: TMenuItem;
    menu_edit_manager: TMenuItem;
    Label_cars: TLabel;
    Label_managers: TLabel;
    Label_operators: TLabel;
    menu_customer: TMenuItem;
    menu_address: TMenuItem;
    procedure menu_ordersClick(Sender: TObject);
    procedure menu_distr_carsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure menu_diverClick(Sender: TObject);
    procedure menu_managerClick(Sender: TObject);
    procedure menu_operatorClick(Sender: TObject);
    procedure menu_updateClick(Sender: TObject);
    procedure menu_edit_carClick(Sender: TObject);
    procedure menu_edit_driverClick(Sender: TObject);
    procedure menu_edit_operatorClick(Sender: TObject);
    procedure menu_edit_managerClick(Sender: TObject);
    procedure menu_carClick(Sender: TObject);
    procedure menu_customerClick(Sender: TObject);
    procedure menu_addressClick(Sender: TObject);
    procedure update;
    procedure DataSource_carsDataChange(Sender: TObject; Field: TField);
    procedure DataSource_driversDataChange(Sender: TObject; Field: TField);
    procedure DataSource_managersDataChange(Sender: TObject; Field: TField);
    procedure DataSource_operatorsDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    user : TUser;
  public
    { Public declarations }
  end;

var
  Form_manager: TForm_manager;

implementation

{$R *.dfm}

uses operator_window_inh, car_distributing_window, add_car_window, add_address_window, add_worker_window, add_customer_window;

procedure TForm_manager.update;
begin
  dm.open_all;
end;
procedure TForm_manager.DataSource_carsDataChange(Sender: TObject;
  Field: TField);
begin
    ShowScrollBar(DBGrid_cars.Handle, SB_BOTH, False);
    ShowScrollBar(DBGrid_cars.Handle, sb_Horz , False);
end;

procedure TForm_manager.DataSource_driversDataChange(Sender: TObject;
  Field: TField);
begin
    ShowScrollBar(DBGrid_drivers.Handle, SB_BOTH, False);
    ShowScrollBar(DBGrid_cars.Handle, sb_Horz , False);
end;

procedure TForm_manager.DataSource_managersDataChange(Sender: TObject;
  Field: TField);
begin
    ShowScrollBar(DBGrid_managers.Handle, SB_BOTH, False);
    ShowScrollBar(DBGrid_cars.Handle, sb_Horz , False);
end;

procedure TForm_manager.DataSource_operatorsDataChange(Sender: TObject;
  Field: TField);
begin
    ShowScrollBar(DBGrid_operators.Handle, SB_BOTH, False);
    ShowScrollBar(DBGrid_cars.Handle, sb_Horz , False);
end;

procedure TForm_manager.FormCreate(Sender: TObject);
var toplevel, underlevel, i:integer;
begin
  inherited;
  Screen.MenuFont.Name := 'Verdana';
  toplevel := 25;
  underlevel := trunc(screen.Height/10+10);
  Width := screen.Width;
  Height := screen.Height;
  DBGrid_cars.Width := trunc(Width/4);
  DBGrid_cars.Left := 0;
  DBGrid_cars.Height := trunc(Height - toplevel - underlevel);
  DBGrid_cars.Top := toplevel;
  for i := 0 to 2 do begin
     DBGrid_cars.Columns[i].Width := trunc(DBGrid_cars.Width/3-6);
  end;
  label_cars.Left := 5;

  DBGrid_drivers.Width := trunc(Width/4);
  DBGrid_drivers.Left := trunc(Width/4);
  DBGrid_drivers.Height := trunc(Height - toplevel - underlevel);
  DBGrid_drivers.Top := toplevel;
  for i := 0 to 3 do begin
     DBGrid_drivers.Columns[i].Width := trunc(DBGrid_drivers.Width/4-6);
  end;
  label_drivers.Left := trunc(Width/4)+5;

  DBGrid_managers.Width:= trunc(Width/4);
  DBGrid_managers.Left := trunc(Width*2/4);
  DBGrid_managers.Height := trunc(Height - toplevel - underlevel);
  DBGrid_managers.Top := toplevel;
  for i := 0 to 3 do begin
     DBGrid_managers.Columns[i].Width := trunc(DBGrid_managers.Width/4-6);
  end;
  label_managers.Left := trunc(Width*2/4)+5;

  DBGrid_operators.Width := trunc(Width/4);
  DBGrid_operators.Left := trunc(Width*3/4);
  DBGrid_operators.Height := trunc(Height - toplevel - underlevel);
  DBGrid_operators.Top := toplevel;
  for i := 0 to 3 do begin
     DBGrid_operators.Columns[i].Width := trunc(DBGrid_operators.Width/4-6);
  end;
  label_operators.Left := trunc(Width*3/4)+5;

  update;
end;

procedure TForm_manager.menu_diverClick(Sender: TObject);
begin
  form_Add_Worker := Tform_Add_Worker.Create(APPLICATION);
  form_Add_Worker.showmodal;
  if form_Add_Worker.ModalResult = mrOk then  begin
      dm_add.add_worker(2, StrtoInt(form_Add_Worker.label_exp.Text),
                        form_Add_Worker.dtp_DOB.datetime,
                        form_Add_Worker.label_name.text,
                        form_Add_Worker.label_surname.text,
                        form_Add_Worker.label_login.text,
                        form_Add_Worker.label_password.text);
   end;
   update;
end;

procedure TForm_manager.menu_managerClick(Sender: TObject);
begin
  form_Add_Worker := Tform_Add_Worker.Create(APPLICATION);
  form_Add_Worker.showmodal;
  if form_Add_Worker.ModalResult = mrOk then  begin
      dm_add.add_worker(0, StrtoInt(form_Add_Worker.label_exp.Text),
                        form_Add_Worker.dtp_DOB.datetime,
                        form_Add_Worker.label_name.text,
                        form_Add_Worker.label_surname.text,
                        form_Add_Worker.label_login.text,
                        form_Add_Worker.label_password.text);

   end;
   update;
end;

procedure TForm_manager.menu_operatorClick(Sender: TObject);
begin
  form_Add_Worker := Tform_Add_Worker.Create(APPLICATION);
  form_Add_Worker.showmodal;
  if form_Add_Worker.ModalResult = mrOk then  begin
      dm_add.add_worker(1, StrtoInt(form_Add_Worker.label_exp.Text),
                        form_Add_Worker.dtp_DOB.datetime,
                        form_Add_Worker.label_name.text,
                        form_Add_Worker.label_surname.text,
                        form_Add_Worker.label_login.text,
                        form_Add_Worker.label_password.text);

   end;
   update;
end;

procedure TForm_manager.menu_addressClick(Sender: TObject);
begin
  form_Add_Address := Tform_Add_Address.Create(Application);
  form_Add_Address.ShowModal;
  if form_Add_Address.ModalResult = mrOk then  begin
      dm_add.add_address(form_Add_Address.label_city.Text,
                         form_Add_Address.label_street.Text,
                         StrToInt(form_Add_Address.label_number.Text),
                         StrToInt(form_Add_Address.label_floor.Text));
   end;
   update;
end;

procedure TForm_manager.menu_carClick(Sender: TObject);
begin
   form_Add_Car := Tform_Add_Car.Create(APPLICATION);
   form_Add_Car.showmodal;
   if form_Add_Car.ModalResult = mrOk then  begin
       dm_add.add_car(form_Add_Car.label_mark.Text,
                      form_Add_Car.label_number.Text,
                      form_Add_Car.label_model.Text);
   end;

   dm.TVehicle.Refresh;
end;

procedure TForm_manager.menu_customerClick(Sender: TObject);
begin
  form_Add_customer := Tform_Add_customer.Create(Application);
  form_Add_customer.ShowModal;
  if form_Add_customer.ModalResult = mrOk then  begin
      dm_add.add_customer(form_Add_customer.label_name.Text,
                          form_Add_customer.label_surname.Text,
                          dm.TAddress_In.FieldByName('ID').Value,
                          form_Add_customer.label_phone.Text);
   end;
   update;
end;

procedure TForm_manager.menu_distr_carsClick(Sender: TObject);
begin
  Form_car_distributing := TForm_car_distributing.create(APPLICATION);
  Form_car_distributing.showmodal;
end;

procedure TForm_manager.menu_ordersClick(Sender: TObject);
begin
  Form_inh_operator := TForm_inh_operator.create(Application);
  Form_inh_operator.showmodal;
end;

procedure TForm_manager.menu_updateClick(Sender: TObject);
begin
  update;
end;

procedure TForm_manager.menu_edit_carClick(Sender: TObject);
begin
  form_Add_Car := Tform_Add_Car.Create(APPLICATION);
  with form_Add_Car do begin
    label_mark.Text := dm.TVehicle.FieldByName('MARKA').Value;
    label_number.Text := dm.TVehicle.FieldByName('NUMBER').Value;
    label_model.Text := dm.TVehicle.FieldByName('MODEL').Value;
    showmodal;
  end;
  if form_Add_Car.ModalResult = mrOk then  begin
      dm_add.edit_car(dm.TVehicle.FieldByName('ID').Value,
                      form_Add_Car.label_mark.Text,
                      form_Add_Car.label_number.Text,
                      form_Add_Car.label_model.Text);
   end;
   dm.TVehicle.Refresh;
   update;
end;

procedure TForm_manager.menu_edit_driverClick(Sender: TObject);
begin
  form_Add_Worker := Tform_Add_Worker.Create(APPLICATION);
  with form_Add_Worker do begin
    label_name.Text := dm.QDrivers.FieldByName('NAME').Value;
    label_surname.Text := dm.QDrivers.FieldByName('SURNAME').Value;
    label_exp.Text := dm.QDrivers.FieldByName('EXPERIENCE').Value;
    dtp_DOB.DateTime := dm.QDrivers.FieldByName('DOB').AsDateTime;
    label_login.Text := dm.QDrivers.FieldByName('LOGIN').Value;
    label_password.Text := dm.QDrivers.FieldByName('PASSWORD_').Value;
    showmodal;
  end;

  if form_Add_Worker.ModalResult = mrOk then  begin
      dm_add.edit_worker(dm.QDrivers.FieldByName('ID').Value,
                         dm.QDrivers.FieldByName('STATUS').Value, 2,
                         StrtoInt(form_Add_Worker.label_exp.Text),
                         form_Add_Worker.dtp_DOB.datetime,
                         form_Add_Worker.label_name.text,
                         form_Add_Worker.label_surname.text,
                         form_Add_Worker.label_login.text,
                         form_Add_Worker.label_password.text);

   end;
    update;
end;

procedure TForm_manager.menu_edit_managerClick(Sender: TObject);
begin
  form_Add_Worker := Tform_Add_Worker.Create(APPLICATION);
  with form_Add_Worker do begin
    label_name.Text := dm.QManagers.FieldByName('NAME').Value;
    label_surname.Text := dm.QManagers.FieldByName('SURNAME').Value;
    label_exp.Text := dm.QManagers.FieldByName('EXPERIENCE').Value;
    dtp_DOB.DateTime := dm.QManagers.FieldByName('DOB').AsDateTime;
    label_login.Text := dm.QManagers.FieldByName('LOGIN').Value;
    label_password.Text := dm.QManagers.FieldByName('PASSWORD_').Value;
    showmodal;
  end;
  if form_Add_Worker.ModalResult = mrOk then  begin
      dm_add.edit_worker(dm.QManagers.FieldByName('ID').Value,
                         dm.QManagers.FieldByName('STATUS').Value, 0,
                         StrtoInt(form_Add_Worker.label_exp.Text),
                         form_Add_Worker.dtp_DOB.datetime,
                         form_Add_Worker.label_name.text,
                         form_Add_Worker.label_surname.text,
                         form_Add_Worker.label_login.text,
                         form_Add_Worker.label_password.text);

   end;
    update;
end;

procedure TForm_manager.menu_edit_operatorClick(Sender: TObject);
begin
  form_Add_Worker := Tform_Add_Worker.Create(APPLICATION);
  with form_Add_Worker do begin
    label_name.Text := dm.QOperators.FieldByName('NAME').Value;
    label_surname.Text := dm.QOperators.FieldByName('SURNAME').Value;
    label_exp.Text := dm.QOperators.FieldByName('EXPERIENCE').Value;
    dtp_DOB.DateTime := dm.QOperators.FieldByName('DOB').AsDateTime;
    label_login.Text := dm.QOperators.FieldByName('LOGIN').Value;
    label_password.Text := dm.QOperators.FieldByName('PASSWORD_').Value;
    showmodal;
  end;
  if form_Add_Worker.ModalResult = mrOk then  begin
      dm_add.edit_worker(dm.QOperators.FieldByName('ID').Value,
                         dm.QOperators.FieldByName('STATUS').Value, 1,
                         StrtoInt(form_Add_Worker.label_exp.Text),
                         form_Add_Worker.dtp_DOB.datetime,
                         form_Add_Worker.label_name.text,
                         form_Add_Worker.label_surname.text,
                         form_Add_Worker.label_login.text,
                         form_Add_Worker.label_password.text);

   end;
   update;
end;

end.
