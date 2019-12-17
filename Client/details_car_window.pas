unit details_car_window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, data_module;

type
  Tform_Details_Car = class(TForm)
    label_marka: TLabel;
    label_number: TLabel;
    label_model: TLabel;
    label_id: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    id_car: integer;
  end;

var
  form_Details_Car: Tform_Details_Car;

implementation

{$R *.dfm}

procedure Tform_Details_Car.FormCreate(Sender: TObject);
begin
    Width := trunc(screen.Width/4);
    Height := trunc(screen.Height/3);
end;

procedure Tform_Details_Car.FormShow(Sender: TObject);
begin
    dm.QCar_By_Id.ParamByName('ID_CAR').Value := id_car;
    dm.QCar_By_Id.Open;
    form_Details_Car.label_id.Caption := 'Id: ' + IntToStr(id_car);
    form_Details_Car.label_marka.Caption := 'Марка: ' + dm.QCar_By_Id.FieldByName('MARKA').Value;
    form_Details_Car.label_number.Caption := 'Номер: ' + dm.QCar_By_Id.FieldByName('NUMBER').Value;
    form_Details_Car.label_model.Caption := 'Модель: ' + dm.QCar_By_Id.FieldByName('MODEL').Value;
    dm.QCar_By_Id.Close;
end;

end.
