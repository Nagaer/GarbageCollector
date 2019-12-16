unit Manager_class;

interface
  uses Operator_class;

   type Manager = class(Operator_)

    procedure unpin_order();
    procedure delete_order();
   end;
implementation

  procedure Manager.unpin_order;
  begin

  end;

  procedure Manager.delete_order;
  begin

  end;

end.
