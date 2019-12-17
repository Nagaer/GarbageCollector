unit details_worker_window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, data_module;

type
  Tform_Details_Worker = class(TForm)
    label_name: TLabel;
    label_surname: TLabel;
    label_role: TLabel;
    label_dob: TLabel;
    label_exp: TLabel;
    label_id: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    id_worker:integer;
  end;

var
  form_Details_Worker: Tform_Details_Worker;

implementation

{$R *.dfm}

procedure Tform_Details_Worker.FormCreate(Sender: TObject);
begin
    Width := trunc(screen.Width/4);
    Height := trunc(screen.Height/3);
end;

procedure Tform_Details_Worker.FormShow(Sender: TObject);
var role:integer;
begin
    dm.QWorker_By_Id.ParamByName('ID_WORKER').Value := id_worker;
    dm.QWorker_By_Id.Open;
    form_Details_Worker.label_id.Caption := 'Id: ' + IntToStr(id_worker);
    form_Details_Worker.label_name.Caption := 'Имя: ' + dm.QWorker_By_Id.FieldByName('NAME').Value;
    form_Details_Worker.label_surname.Caption := 'Фамилия: ' + dm.QWorker_By_Id.FieldByName('SURNAME').Value;
    form_Details_Worker.label_dob.Caption := 'Дата принятия: ' + DateTimeToStr(dm.QWorker_By_Id.FieldByName('DOB').Value);
    form_Details_Worker.label_exp.Caption := 'Опыт работы: ' + IntToStr(dm.QWorker_By_Id.FieldByName('EXPERIENCE').Value) + ' лет';
    role := dm.QWorker_By_Id.FieldByName('ROLE_').Value;
    if role=0 then begin
        form_Details_Worker.label_role.Caption := 'Менеджер';
    end
    else if role=1 then begin
        form_Details_Worker.label_role.Caption := 'Оператор';
    end
    else if role=2 then begin
        form_Details_Worker.label_role.Caption := 'Водитель';
    end;
    dm.QWorker_By_Id.Close;
end;

end.
