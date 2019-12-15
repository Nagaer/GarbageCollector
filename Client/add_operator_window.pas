unit add_operator_window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.ExtCtrls;

type
  Tform_Add_Operator = class(TForm)
    label_name: TLabeledEdit;
    label_surname: TLabeledEdit;
    label_exp: TLabeledEdit;
    dtp_DOB: TDateTimePicker;
    Label1: TLabel;
    BitBtn1: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_Add_Operator: Tform_Add_Operator;

implementation

{$R *.dfm}

end.
