unit operator_window_inh;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  IdBaseComponent, IdComponent, IdUDPBase, IdUDPClient,abstsract_operator_window,order_class,
  generics.collections,panel_order,order_interface, IdUDPServer, IdGlobal,driver_class,panel_driver,
  IdSocketHandle,driver_interface, Vcl.Menus, user_class, data_module, data_module_add,Colored_panel_class;

type
  TForm_inh_operator = class(TForm_abstract_operator)
    Panel_orders: TPanel;
    Panel_drivers: TPanel;
    MainMenu1: TMainMenu;
    ADD_ORDER: TMenuItem;
    MENU_UPDATE: TMenuItem;
    procedure MENU_UPDATEClick(Sender: TObject);
    procedure ADD_ORDERClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
  const maxOrdersCount = 5;
    { Private declarations }
     procedure add(Porder:TOrder);override ;
     procedure add(Pdriver:TDriver);override ;
     //procedure add();override;
     procedure update_interface(elem : TElem);override;
     procedure redraw;
     procedure update;override;

      procedure PanelDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);override;
    procedure PanelDragDrop(Sender, Source: TObject; X, Y: Integer);override;



  public
    { Public declarations }
    user : TUser;
    constructor Create(AOwner: TComponent); override;
  end;

var
  Form_inh_operator: TForm_inh_operator;

implementation

{$R *.dfm}

uses add_order_window;

procedure TForm_inh_operator.update;
begin
  inherited;
  update_orders;
  update_drivers;
end;

procedure TForm_inh_operator.add(Porder:TOrder);
var
  new_order_panel : TPanel_order;
begin
    new_order_panel := TPanel_order.Create(Panel_orders,Porder);
    // Add to list of interfaces
    order_list.Add((new_order_panel as TOrder_Interface));

end;

procedure TForm_inh_operator.add(PDriver:TDriver);
var
  new_driver_panel : TPanel_driver;
begin
    new_driver_panel := TPanel_driver.Create(Panel_orders,PDriver,PanelDragOver,PanelDragDrop);
    // Add to list of interfaces
    driver_list.Add((new_driver_panel as TDriver_Interface));
end;





procedure TForm_inh_operator.ADD_ORDERClick(Sender: TObject);
begin
  inherited;
  form_add_order := TForm_add_order.Create(Application);
  form_add_order.showmodal;
  if form_add_order.ModalResult = mrOk then  begin
      dm_add.add_order(dm.QCustomers.FieldByName('ID').Value,
                       StrtoInt(form_add_order.label_weight.Text),
                       dm.TAddress_In.FieldByName('ID').Value,
                       dm.TAddress_Out.FieldByName('ID').Value,
                       form_add_order.dtp_delivery.DateTime,
                       dm.user.get_id,
                       strToInt(form_add_order.label_stevedore.Text),
                       strToInt(form_add_order.label_price.Text));
   end;
   update;
end;

procedure TForm_inh_operator.update_interface(elem : TElem);
var i,j,buff_id : integer;
  order_p : TPanel_order;
begin
      // Bind panel_orders
      for I := 0 to order_list.Count - 1 do begin
        order_p := (order_list[i] as TPanel_order);
        buff_id := order_p.get_driver_id;

        // if order have a driver
        if buff_id <> 0 then  begin
          j := 0;
          while (j < driver_list.count) and (driver_list[j].get_id <> buff_id ) do
             j := j+1;
          if j <> driver_list.Count then
            // Bind it to panel driver
            order_p.Parent := (driver_list[j] as TPanel_driver).get_queue;
        end
        else
          order_p.Parent := panel_orders;
      end;

      // Bind panel_drivers
      for I := 0 to driver_list.Count - 1 do
          (driver_list[i]  as TPanel_driver).parent := panel_drivers;

    redraw;

end;

procedure TForm_inh_operator.redraw;
var
  i : integer;
begin
        // redraw every child of panels
        with panel_orders do begin
          for I := 0 to  ControlCount - 1 do begin
            controls[i].Left := 0;
            controls[i].Width := Panel_orders.Width;
            controls[i].Top := I * 50;
          end
        end;

        with Panel_drivers do begin
          for I := 0 to  ControlCount - 1 do begin
            controls[i].Left := 0;
            controls[i].Top := I * 50;
          end
        end;

        // redraw orders queues
        for I := 0 to driver_list.Count - 1 do
            (driver_list[i]  as TPanel_driver).redraw;

end;

constructor  TForm_inh_operator.Create(AOwner: TComponent);
var i:integer;
begin
  inherited;
  order_updatable := true;
  driver_updatable := true;
  panel_orders.OnDragOver := PanelDragOver;
  panel_orders.OnDragDrop := PanelDragDrop;
  update;
        with panel_orders do begin
          for I := 0 to  ControlCount - 1 do begin
            controls[i].Left := 0;
            controls[i].Width := trunc(screen.Width*0.3);
            controls[i].Top := I * 50;
          end
        end;
end;


procedure TForm_inh_operator.FormCreate(Sender: TObject);
var i:integer;
begin
  inherited;
  Width := screen.Width;
  Height := screen.Height;
  panel_drivers.Width := trunc(Width*0.7);
  panel_orders.Width := trunc(Width*0.3);
  panel_drivers.Height := trunc(Height);
  panel_orders.Height := trunc(Height);
  panel_orders.Left := trunc(Width*0.7);
end;

procedure TForm_inh_operator.MENU_UPDATEClick(Sender: TObject);
begin
  inherited;
  update;
end;

procedure TForm_inh_operator.PanelDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  if (sender as TPanel).Parent is TForm_inh_operator then
     (source as TPanel_order).set_driver( 0 )
  else
    (source as TPanel_order).set_driver( ( (sender as TPanel).Parent as TPanel_Driver ).get_id );
  update_orders;
end;

procedure TForm_inh_operator.PanelDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
     accept := (source is TPanel_order ){and  (sender is TPanel_driver)};
end;



end.
