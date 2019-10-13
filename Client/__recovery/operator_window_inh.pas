unit operator_window_inh;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  IdBaseComponent, IdComponent, IdUDPBase, IdUDPClient,abstsract_operator_window,order_class,
  generics.collections,panel_order,order_interface, IdUDPServer, IdGlobal,
  IdSocketHandle;

type
  TForm_inh_operator = class(TForm_abstract_operator)
    Panel_orders: TPanel;
    Button_update: TButton;
    Button_delete: TButton;
    procedure Button_updateClick(Sender: TObject);
    procedure Button_deleteClick(Sender: TObject);
  private
    { Private declarations }
     procedure add(Porder:TOrder);override ;
     procedure add();override;
     procedure update_interface(elem : TElem);override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  end;

var
  Form_inh_operator: TForm_inh_operator;

implementation

{$R *.dfm}

procedure TForm_inh_operator.add(Porder:TOrder);
var
  new_order_panel : TPanel_order;
begin
    new_order_panel := TPanel_order.Create(Panel_orders,Porder);
    // Add to panel childrens list
    new_order_panel.Parent := Panel_orders;
    // Add to list of interfaces
    order_list.Add((new_order_panel as TOrder_Interface));

end;

procedure TForm_inh_operator.add;
begin

end;

procedure TForm_inh_operator.Button_deleteClick(Sender: TObject);
begin
  inherited;
  delete(1,Driver);
end;

procedure TForm_inh_operator.Button_updateClick(Sender: TObject);
begin
  inherited;
  update_orders;
end;



procedure TForm_inh_operator.update_interface(elem : TElem);
var i : integer;
begin
    if elem = order then
      with Panel_orders do
      for I := 0 to  ControlCount - 1 do begin
        controls[i].Left := 0;
        controls[i].Top := I * 100;
      end;

end;

constructor  TForm_inh_operator.Create(AOwner: TComponent);
begin
  inherited;

end;

end.
