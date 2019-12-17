unit add_customer_window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, data_module, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons;

type
  Tform_Add_customer = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    label_surname: TEdit;
    label_name: TEdit;
    label_phone: TEdit;
    DBGrid1: TDBGrid;
    DataSource_address: TDataSource;
    Label4: TLabel;
    Button_add_adress: TButton;
    procedure Button_add_adressClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_Add_customer: Tform_Add_customer;

implementation

{$R *.dfm}

uses add_address_window, data_module_add;

procedure Tform_Add_customer.Button_add_adressClick(Sender: TObject);
begin
  form_Add_Address := Tform_Add_Address.Create(Application);
  form_Add_Address.ShowModal;
  if form_Add_Address.ModalResult = mrOk then  begin
      dm_add.add_address(form_Add_Address.label_city.Text,
      form_Add_Address.label_street.Text,
      StrToInt(form_Add_Address.label_number.Text),
      StrToInt(form_Add_Address.label_floor.Text));
   end;
   dm.TAddress_In.Refresh;
   dm.TAddress_Out.Refresh;
end;

end.
