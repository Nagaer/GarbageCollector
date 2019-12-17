program clietnt_proj;



uses
  Vcl.Forms,
  login_window in 'login_window.pas' {Login_Form},
  data_module in 'data_module.pas' {dm: TDataModule},
  Panel_order in 'Panel_order.pas',
  Order_class in 'Order_class.pas',
  abstsract_operator_window in 'abstsract_operator_window.pas' {Form_abstract_operator},
  order_interface in 'order_interface.pas',
  operator_window_inh in 'operator_window_inh.pas' {Form_inh_operator},
  Driver_class in 'Driver_class.pas',
  Human_class in 'Human_class.pas',
  Panel_driver in 'Panel_driver.pas',
  driver_interface in 'driver_interface.pas',
  test_window in 'test_window.pas' {form_test},
  Manager_window in 'Manager_window.pas' {Form_manager},
  add_order_window in 'add_order_window.pas' {Form_add_order},
  car_distributing_window in 'car_distributing_window.pas' {Form_car_distributing},
  Vehicle_class in 'Vehicle_class.pas',
  vehicle_interface in 'vehicle_interface.pas',
  Panel_vehicle in 'Panel_vehicle.pas',
  date_picker_window in 'date_picker_window.pas' {Form_date_picker},
  User_class in 'User_class.pas',
  data_module_add in 'data_module_add.pas' {dm_add: TDataModule},
  add_car_window in 'add_car_window.pas' {form_Add_Car},
  add_worker_window in 'add_worker_window.pas' {form_Add_Worker},
  Colored_panel_class in 'Colored_panel_class.pas',
  add_customer_window in 'add_customer_window.pas' {form_Add_customer},
  add_address_window in 'add_address_window.pas' {form_Add_Address},
  details_car_window in 'details_car_window.pas' {form_Details_Car},
  details_worker_window in 'details_worker_window.pas' {form_Details_Worker},
  details_order_window in 'details_order_window.pas' {form_Details_Order},
  common_db in 'common_db.pas' {dm_db: TDataModule},
  statuses in 'statuses.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
 // Application.Create(Tdm_db,dm_db);
  Application.CreateForm(Tdm_db, dm_db);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(Tdm_add, dm_add);
  //Application.CreateForm(Tform_Details_Worker, form_Details_Worker);
  //Application.CreateForm(Tform_Details_Order, form_Details_Order);
  //Application.CreateForm(Tform_Details_Car, form_Details_Car);
  //Application.CreateForm(Tform_Add_Address, form_Add_Address);
  //Application.CreateForm(Tform_Add_customer, form_Add_customer);
  //Application.CreateForm(Tform_Add_Worker, form_Add_Worker);
  //Application.CreateForm(Tform_Add_Driver, form_Add_Driver);
  //Application.CreateForm(Tform_Add_Manager, form_Add_Manager);
  //Application.CreateForm(Tform_Add_Operator, form_Add_Operator);
  //Application.CreateForm(Tform_Add_Car, form_Add_Car);
  //Application.CreateForm(TForm_inh_operator, Form_inh_operator);
  //Application.CreateForm(TForm_add_order, Form_add_order);
  //Application.CreateForm(TForm_car_distributing, Form_car_distributing);
  Application.CreateForm(TLogin_Form, Login_Form);
  //Application.CreateForm(TForm_manager, Form_manager);
  //Application.CreateForm(Tform_test, form_test);
  // Application.CreateForm(TForm_date_picker, Form_date_picker);
  //Application.CreateForm(Toperator_form, operator_form);

  //Application.CreateForm(TForm_abstract_operator, Form_abstract_operator);

  Application.Run;
end.
