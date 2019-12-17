unit add_order_window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, data_module, data_module_add, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons, add_customer_window;

type
  TForm_add_order = class(TForm)
    DBGrid_customers: TDBGrid;
    DataSource_customers: TDataSource;
    DataSource_from_address: TDataSource;
    DBGrid_from_address: TDBGrid;
    DBGrid_to_address: TDBGrid;
    dtp_delivery: TDateTimePicker;
    label_weight: TEdit;
    label_stevedore: TEdit;
    label_price: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    BitBtn1: TBitBtn;
    DataSource_to_address: TDataSource;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_add_order: TForm_add_order;

implementation

{$R *.dfm}

procedure TForm_add_order.Button1Click(Sender: TObject);
begin
  form_Add_customer := Tform_Add_customer.Create(Application);
  form_Add_customer.ShowModal;
  if form_Add_customer.ModalResult = mrOk then  begin
      dm_add.add_customer(form_Add_customer.label_name.Text,
                          form_Add_customer.label_surname.Text,
                          dm.TAddress_In.FieldByName('ID').Value,
                          form_Add_customer.label_phone.Text);
   end;
   dm.open_all;
end;

end.
