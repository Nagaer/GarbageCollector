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
  date_picker_window in 'date_picker_window.pas' {Form_date_picker};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tdm, dm);

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
