unit details_order_window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, data_module, Vcl.StdCtrls, Vcl.Buttons,
  user_class,statuses;

type
  Tform_Details_Order = class(TForm)
    label_customer_surname_and_name: TLabel;
    label_customer_phone: TLabel;
    label_customer_address: TLabel;
    label_weight: TLabel;
    label_from_address: TLabel;
    label_to_address: TLabel;
    label_dod: TLabel;
    label_driver: TLabel;
    label_operator: TLabel;
    label_stevedors: TLabel;
    label_price: TLabel;
    BitBtn1: TBitBtn;
    label_id: TLabel;
    label_status: TLabel;
    BitBtn_cancel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn_cancelClick(Sender: TObject);
  private
    { Private declarations }
    const statusOnExit = 6;
  public
    { Public declarations }
    id_order:integer;
    procedure set_status(status: integer);
  end;

var
  form_Details_Order: Tform_Details_Order;

implementation

{$R *.dfm}

procedure   Tform_Details_Order.set_status(status: Integer);
var who_driver : integer;
begin
      dm.QOrder_By_Id.ParamByName('ID_ORDER').Value := id_order;
    dm.QOrder_By_Id.Open;
    if varisnull(dm.QOrder_By_Id.FieldByName('WHO_DRIVER').Value) then
      who_driver := 0
      else
      who_driver  := dm.QOrder_By_Id.FieldByName('WHO_DRIVER').Value;
    dm.QOrder_By_Id.Close;
    with dm.spEdit_Order_Status do
    begin

    ParamByName('ID_ORDER').AsInteger := id_order;
    ParamByName('ID_WORKERS').AsInteger:= who_driver;
    ParamByName('NEW_STATUS').AsInteger:=  status;

    // Execute the procedure
    if not Transaction.InTransaction then
      Transaction.StartTransaction;
    ExecProc;
    Transaction.Commit;
    end;
    dm.open_all;
end;
procedure Tform_Details_Order.BitBtn_cancelClick(Sender: TObject);
begin
     set_status(status_cancel);
end;

procedure Tform_Details_Order.BitBtn1Click(Sender: TObject);
begin
    set_status(status_done);
end;

procedure Tform_Details_Order.FormCreate(Sender: TObject);
begin
    Width := trunc(screen.Width/3);
    Height := trunc(screen.Height/1.5);
    bitbtn_cancel.Visible := dm.user.get_role = manager;
end;

procedure Tform_Details_Order.FormShow(Sender: TObject);
var customer_id, customer_address_id, address_id_from, address_id_to, driver_id, operator_id, order_status:integer;
  check_driver, check_operator:boolean;
begin
    dm.QOrder_By_Id.ParamByName('ID_ORDER').Value := id_order;
    dm.QOrder_By_Id.Open;
    form_Details_Order.label_id.Caption := 'Id: ' + IntToStr(id_order);
    customer_id := dm.QOrder_By_Id.FieldByName('ID_CUSTOMER').Value;
    form_Details_Order.label_weight.Caption := 'Вес груза: ' + IntToStr(dm.QOrder_By_Id.FieldByName('WEIGHT').Value) + ' грамм';
    address_id_from := dm.QOrder_By_Id.FieldByName('FROM_ID_ADDRESS').Value;
    address_id_to := dm.QOrder_By_Id.FieldByName('TO_ID_ADDRESS').Value;
    form_Details_Order.label_dod.Caption := 'Дата доставки: ' + DateTimeToStr(dm.QOrder_By_Id.FieldByName('DATE_OF_DELIVERY').Value);
    if VarIsNull(dm.QOrder_By_Id.FieldByName('WHO_DRIVER').Value) then begin
      check_driver:=false;
    end
    else begin
      check_driver:=true;
      driver_id := dm.QOrder_By_Id.FieldByName('WHO_DRIVER').Value;
    end;
    if VarIsNull(dm.QOrder_By_Id.FieldByName('ID_OPERATOR').Value) then begin
      check_operator:=false;
    end
    else begin
      check_operator:=true;
      operator_id := dm.QOrder_By_Id.FieldByName('ID_OPERATOR').Value;
    end;
    form_Details_Order.label_stevedors.Caption := 'Кол-во грузчиков: ' + IntToStr(dm.QOrder_By_Id.FieldByName('NUMBER_STEVEDORE').Value) + ' человек';
    form_Details_Order.label_price.Caption := 'Цена: ' + IntToStr(dm.QOrder_By_Id.FieldByName('PRICE').Value) + ' руб.';
    order_status := dm.QOrder_By_Id.FieldByName('STATUS').Value;
    dm.QOrder_By_Id.Close;

    dm.QCustomer_By_Id.ParamByName('ID_CUSTOMER').Value := customer_id;
    dm.QCustomer_By_Id.Open;
    form_Details_Order.label_customer_surname_and_name.Caption := 'Заказчик: ' + dm.QCustomer_By_Id.FieldByName('SURNAME').Value + ' ' + dm.QCustomer_By_Id.FieldByName('NAME').Value;
    customer_address_id := dm.QCustomer_By_Id.FieldByName('ID_ADDRESS').Value;
    form_Details_Order.label_customer_phone.Caption := 'Номер заказчика: +' + dm.QCustomer_By_Id.FieldByName('PHONE_NUMBER').Value;
    dm.QCustomer_By_Id.Close;

    dm.QAddress_By_Id.ParamByName('ID_ADDRESS').Value := customer_address_id;
    dm.QAddress_By_Id.Open;
    form_Details_Order.label_customer_address.Caption := 'Адрес заказчика: г. ' + dm.QAddress_By_Id.FieldByName('CITY').Value + ', ул. ' + dm.QAddress_By_Id.FieldByName('STREET').Value + ', д. ' + IntToStr(dm.QAddress_By_Id.FieldByName('NUMBER_HOUSE').Value) + ', этаж №' + IntToStr(dm.QAddress_By_Id.FieldByName('FLOOR_').Value);
    dm.QAddress_By_Id.Close;

    dm.QAddress_By_Id.ParamByName('ID_ADDRESS').Value := address_id_from;
    dm.QAddress_By_Id.Open;
    form_Details_Order.label_from_address.Caption := 'Откуда: г. ' + dm.QAddress_By_Id.FieldByName('CITY').Value + ', ул. ' + dm.QAddress_By_Id.FieldByName('STREET').Value + ', д. ' + IntToStr(dm.QAddress_By_Id.FieldByName('NUMBER_HOUSE').Value) + ', этаж №' + IntToStr(dm.QAddress_By_Id.FieldByName('FLOOR_').Value);
    dm.QAddress_By_Id.Close;

    dm.QAddress_By_Id.ParamByName('ID_ADDRESS').Value := address_id_to;
    dm.QAddress_By_Id.Open;
    form_Details_Order.label_to_address.Caption := 'Куда: г. ' + dm.QAddress_By_Id.FieldByName('CITY').Value + ', ул. ' + dm.QAddress_By_Id.FieldByName('STREET').Value + ', д. ' + IntToStr(dm.QAddress_By_Id.FieldByName('NUMBER_HOUSE').Value) + ', этаж №' + IntToStr(dm.QAddress_By_Id.FieldByName('FLOOR_').Value);
    dm.QAddress_By_Id.Close;

    if check_driver then begin
        dm.QWorker_By_Id.ParamByName('ID_WORKER').Value := driver_id;
        dm.QWorker_By_Id.Open;
        form_Details_Order.label_driver.Caption := 'Водитель: ' + dm.QWorker_By_Id.FieldByName('NAME').Value + ' ' + dm.QWorker_By_Id.FieldByName('SURNAME').Value;
        dm.QWorker_By_Id.Close;
    end
    else begin
        form_Details_Order.label_driver.Caption := 'Водитель: отсутствует';
    end;

    if check_operator then begin
        dm.QWorker_By_Id.ParamByName('ID_WORKER').Value := operator_id;
        dm.QWorker_By_Id.Open;
        form_Details_Order.label_operator.Caption := 'Оператор: ' + dm.QWorker_By_Id.FieldByName('NAME').Value + ' ' + dm.QWorker_By_Id.FieldByName('SURNAME').Value;
        dm.QWorker_By_Id.Close;
    end
    else begin
        form_Details_Order.label_operator.Caption := 'Оператор: отсутствует';
    end;
    if order_status=0 then begin
      form_Details_Order.label_status.Caption := 'Заказ создан, но не распределён';
    end
    else if order_status=2 then begin
      form_Details_Order.label_status.Caption := 'Заказ распределён водителю';
    end
    else if order_status=3 then begin
      form_Details_Order.label_status.Caption := 'Заказ просмотрен водителем';
    end
    else if order_status=4 then begin
      form_Details_Order.label_status.Caption := 'Водитель приступил к выполнению заказа';
    end
    else if order_status=5 then begin
      form_Details_Order.label_status.Caption := 'Водитель прибыл на место';
    end
    else if order_status=6 then begin
      form_Details_Order.label_status.Caption := 'Водитель завершил работу над заказом';
    end
    else if order_status=7 then begin
      form_Details_Order.label_status.Caption := 'Завершение заказа подтвеждено оператором';
    end
    else if order_status=8 then begin
      form_Details_Order.label_status.Caption := 'Заказ отменён';
    end
    else begin
      form_Details_Order.label_status.Caption := 'Ошибка со статусом заказа';
    end;

    if order_status=statusOnExit then begin
        BitBtn1.Visible:=true;
    end
    else begin
        BitBtn1.Visible:=false;
    end;
end;

end.
