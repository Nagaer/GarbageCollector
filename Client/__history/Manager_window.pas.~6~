unit Manager_window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TForm_manager = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    menu_diver: TMenuItem;
    menu_operator: TMenuItem;
    menu_manager: TMenuItem;
    menu_distr_cars: TMenuItem;
    menu_orders: TMenuItem;
    procedure menu_ordersClick(Sender: TObject);
    procedure menu_distr_carsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_manager: TForm_manager;

implementation

{$R *.dfm}

uses operator_window_inh, car_distributing_window;



procedure TForm_manager.menu_distr_carsClick(Sender: TObject);
begin
  Form_car_distributing := TForm_car_distributing.create(APPLICATION);
  Form_car_distributing.showmodal;
end;

procedure TForm_manager.menu_ordersClick(Sender: TObject);
begin
  Form_inh_operator := TForm_inh_operator.create(Application);
  Form_inh_operator.showmodal;
end;

end.
