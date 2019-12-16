unit login_window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TLogin_Form = class(TForm)
    Edit_login: TEdit;
    Edit_password: TEdit;
    Label1: TLabel;
    Button_log_in: TButton;
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

uses Manager_window;

procedure TLogin_Form.Button_log_inClick(Sender: TObject);
begin
    // Send request to bd

    // Got user role

    // If user is manager
    // open manager window
    //Form_manager.create;
    Form_manager.ShowModal;
    // else open operator window
end;



end.
