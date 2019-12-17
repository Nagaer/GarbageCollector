unit add_worker_window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.ExtCtrls;

type
  Tform_Add_Worker = class(TForm)
    Label1: TLabel;
    dtp_DOB: TDateTimePicker;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    label_name: TEdit;
    label_surname: TEdit;
    label_exp: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    label_login: TEdit;
    label_password: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_Add_Worker: Tform_Add_Worker;

implementation

{$R *.dfm}

end.
