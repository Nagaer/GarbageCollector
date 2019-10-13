program clietnt_proj;



uses
  Vcl.Forms,
  operator_window in 'operator_window.pas' {operator_form},
  login_window in 'login_window.pas' {Login_Form},
  data_module in 'data_module.pas' {dm: TDataModule},
  Panel_order in 'Panel_order.pas',
  Order_class in 'Order_class.pas',
  abstsract_operator_window in 'abstsract_operator_window.pas' {Form_abstract_operator},
  order_interface in 'order_interface.pas',
  Unit1 in 'Unit1.pas' {Form_operator};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tdm, dm);
  //Application.CreateForm(Toperator_form, operator_form);
  //Application.CreateForm(TLogin_Form, Login_Form);
  //Application.CreateForm(TForm_abstract_operator, Form_abstract_operator);

  Application.Run;
end.
