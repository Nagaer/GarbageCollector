unit vehicle_interface;

interface
  uses vehicle_class;
  type TVehicle_interface = interface
    ['{F81262EA-AF18-49D4-A701-96AC4DC080FA}']
    function get_id: integer;
    function get_status : integer;
    procedure update_vehicle(updated_vehicle : TVehicle);
    procedure destroy_from_interface;
    procedure set_driver(id_driver: integer);
  end;
implementation

end.
