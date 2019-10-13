unit order_interface;

interface
  uses order_class, IBX.IBTable;
 type TOrder_Interface = interface
['{C1F3094E-A411-40BA-AB7F-FFE420F4B0A3}']
 function get_id: integer;
 function get_status : integer;
 procedure update_order(updated_order : TOrder);
 procedure destroy_from_interface;
 procedure set_driver(id_driver: integer);
end;
implementation

end.
