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
    N2: TMenuItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_manager: TForm_manager;

implementation

{$R *.dfm}



end.
