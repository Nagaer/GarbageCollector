unit login_window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, data_module,  User_class;

type
  TLogin_Form = class(TForm)
    Edit_login: TEdit;
    Edit_password: TEdit;
    Label1: TLabel;
    Button_log_in: TButton;
    Label2: TLabel;
    Edit_adress: TEdit;
    Label3: TLabel;
    Edit_path: TEdit;
    procedure Button_log_inClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Login_Form: TLogin_Form;

implementation

{$R *.dfm}
    //192.168.43.115
    //212.192.146.102
    //C:\Users\Ibrag\Desktop\Delphi\Programms\FREIGHT_TAXI_actual_changes.FDB
    //C:\Users\dupel\firebird_db\FREIGHT_TAXI_actualest_changes.FDB
uses Manager_window, operator_window_inh, common_db;

procedure TLogin_Form.Button_log_inClick(Sender: TObject);
var
worker_id,role : integer;
begin
    // Send request to bd
    dm_db.edit_host(Edit_adress.Text,Edit_path.Text);
    dm.open_all;
    with dm.spLogin do
    begin

    ParamByName('IN_LOGIN').value :=  Edit_login.Text;
    ParamByName('IN_PASSWORD').value := Edit_password.Text;

    // Execute the procedure
    if not Transaction.InTransaction then
      Transaction.StartTransaction;
    ExecProc;
    Transaction.Commit;
    dm.open_all;
    // if loggin successsed
    if ParamByName('OUT_SUCCESS').value = 1 then begin
        worker_id := ParamByName('OUT_WORKER_ID').value;
        role := ParamByName('OUT_ROLE').value;
        dm.user := TUser.Create(worker_id,role);

        // Got user role


          // If user is manager
          // open manager window
          if  dm.user.get_role = manager then begin

            Form_manager := TForm_manager.create(APPLICATION);
            Form_manager.ShowModal;
          end
          else if dm.user.get_role = oper then begin
            Form_inh_operator := TForm_inh_operator.create(APPLICATION);
            Form_inh_operator.ShowModal;
          end;
          // else open operator window
    end
    else  // If login refused
      begin
        label1.Caption := 'Õ≈¬≈–Õ€… ÀŒ√»Õ »À» œ¿–ŒÀ‹';
      end;
    end;







end;



end.
