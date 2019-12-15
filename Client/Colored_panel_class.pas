unit Colored_panel_class;

interface
 uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, IBX.IBTable, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, order_class,order_interface;

type TColoredPanel = Class(TPanel)
  procedure change_color(p_color : TColor);
  constructor Create(AOwner: TComponent);
End;
implementation

constructor TColoredPanel.Create(AOwner: TComponent);
begin
    inherited Create(AOwner);
     ParentBackground := false;
     ParentColor := false;
end;
procedure   TColoredPanel.change_color(p_color: TColor);
begin
  color := p_color;
end;

end.
