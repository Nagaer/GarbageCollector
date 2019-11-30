unit Human_class;

interface
     type Human = Class
       protected
        Name : string;
        Surname : string;
        Dob : TDate;
        Experience : integer;

        sex : (Male,Female);
        code: array [0..10] of integer;
       public
        procedure Add();
        procedure delete();
        procedure Edit();
     End;
implementation
  procedure Human.Add;
  begin

  end;

  procedure Human.delete;
  begin

  end;

  procedure Human.Edit;
  begin

  end;
end.
