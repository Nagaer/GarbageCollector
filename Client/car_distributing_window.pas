unit car_distributing_window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, abstsract_operator_window, IdUDPServer,
  IdGlobal, IdSocketHandle, Vcl.ExtCtrls, IdBaseComponent, IdComponent,
  IdUDPBase, Vehicle_class, panel_Vehicle, Vehicle_interface, driver_class,
  driver_interface, panel_driver, Vcl.Menus, data_module;

type
  TForm_car_distributing = class(TForm_abstract_operator)
    Panel_driver: TPanel;
    Panel_vehicle: TPanel;
    MainMenu1: TMainMenu;
    menu_update: TMenuItem;
    menu_data: TMenuItem;
    procedure menu_updateClick(Sender: TObject);
    procedure menu_dataClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    curr_date: TDate;

    procedure add(PVehicle:TVehicle);override ;
    procedure add(Pdriver:TDriver);override ;
    procedure update_interface(elem : TElem);override;

    procedure redraw;
    procedure update;

     procedure PanelDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);override;
    procedure PanelDragDrop(Sender, Source: TObject; X, Y: Integer);override;

  public
    { Public declarations }

  end;

var
  Form_car_distributing: TForm_car_distributing;

implementation

{$R *.dfm}

uses date_picker_window;

procedure TForm_car_distributing.update;
begin
  update_drivers;
  update_vehicles(curr_date);
end;
procedure TForm_car_distributing.add(PVehicle:TVehicle);
var
  new_Vehicle_panel : TPanel_Vehicle;
begin
    new_Vehicle_panel := TPanel_Vehicle.Create(Panel_vehicle,PVehicle);
    // Add to list of interfaces
    Vehicle_list.Add((new_Vehicle_panel as TVehicle_Interface));

end;

procedure TForm_car_distributing.add(PDriver:TDriver);
var
  new_driver_panel : TPanel_driver;
begin
    new_driver_panel := TPanel_driver.Create(Panel_driver,PDriver,PanelDragOver,PanelDragDrop);
    // Add to list of interfaces
    driver_list.Add((new_driver_panel as TDriver_Interface));
end;

procedure TForm_car_distributing.FormCreate(Sender: TObject);
begin
  inherited;
  driver_updatable := true;
  vehicle_updatable := true;
  curr_date := now;

  with panel_vehicle do begin
    OnDragOver := PanelDragOver;
    OnDragDrop := PanelDragDrop;
  end;

  Width := screen.Width;
  Height := screen.Height;
  panel_driver.Width := trunc(Width*0.7);
  Panel_vehicle.Width := trunc(Width*0.3);
  panel_driver.Height := trunc(Height);
  Panel_vehicle.Height := trunc(Height);
  Panel_vehicle.Left := trunc(Width*0.7);

  update;
end;

procedure TForm_car_distributing.menu_dataClick(Sender: TObject);
begin
  inherited;
  form_date_picker := Tform_date_picker.Create(Application);
  form_date_picker.showmodal;
  if form_date_picker.ModalResult= mrOk then begin
        curr_date := form_date_picker.MonthCalendar.Date;
        update_drivers;
        update_vehicles(curr_date);
  end;
end;

procedure TForm_car_distributing.menu_updateClick(Sender: TObject);
begin
  inherited;
  update;
end;

procedure TForm_car_distributing.update_interface(elem : TElem);
var i,j,buff_id : integer;
  vehicle_p : TPanel_vehicle;
begin
      // Bind panel_orders
      for I := 0 to vehicle_list.Count - 1 do begin
       vehicle_p := (vehicle_list[i] as TPanel_vehicle);
        buff_id := vehicle_p.get_driver_id;
        // if order have a driver
        if buff_id <> 0 then  begin
          j := 0;
          while (j < driver_list.count) and (driver_list[j].get_id <> buff_id ) do
             j := j+1;
          if j <> driver_list.Count then
            // Bind it to panel driver
            vehicle_p.Parent := (driver_list[j] as TPanel_driver).get_queue;
        end
        else
          vehicle_p.Parent := panel_vehicle;
      end;

      // Bind panel_drivers
      for I := 0 to driver_list.Count - 1 do
          (driver_list[i]  as TPanel_driver).parent := panel_driver;

    redraw;

end;

procedure  TForm_car_distributing.redraw;
var
  i : integer;
begin
        // redraw every child of panels
        with panel_vehicle do begin
          for I := 0 to  ControlCount - 1 do begin
            controls[i].Left := 0;
            controls[i].Width := trunc(screen.Width*0.3);
            controls[i].Top := I * 50;
          end
        end;

        with Panel_driver do begin
          for I := 0 to  ControlCount - 1 do begin
            controls[i].Left := 0;
            controls[i].Top := I * 50;
          end
        end;

        // redraw orders queues
        for I := 0 to driver_list.Count - 1 do
            (driver_list[i]  as TPanel_driver).redraw;

end;

procedure TForm_car_distributing.PanelDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  if (sender as TPanel).Parent is TForm_car_distributing then
     (source as TPanel_vehicle).set_driver( 0 )
  else
    (source as TPanel_vehicle).set_driver( ( (sender as TPanel).Parent as TPanel_Driver ).get_id );
  update_vehicles(curr_date);
end;

procedure TForm_car_distributing.PanelDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
     accept := (source is TPanel_vehicle ){and  (sender is TPanel_driver)};
end;

end.
