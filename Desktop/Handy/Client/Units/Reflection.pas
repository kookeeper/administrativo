unit Reflection;
  interface
  uses Classes;

   procedure GetPropertyNames(AClass: TClass; var PropertyNames: TStringList);
   { Given a TClass, put all its published properties in the PropertyNames
     TStringList, with the name of the parent where the property is first
     being published.
     Note: the PropertyNames TStringList must be Created before this procedure
     is called (in order to fill it with the list of property names).
   }

  implementation
  uses TypInfo;

    procedure GetPropertyNames(AClass: TClass; var PropertyNames: TStringList);
    var
      TypeInfo: PTypeInfo;
      TypeData: PTypeData;
      PropList: PPropList;
//      ParentName: PString;
      i: Integer;
    begin
      if Assigned(PropertyNames) then { check to see if the TStringList is valid }
      begin
        PropertyNames.Clear;
        TypeInfo := AClass.ClassInfo;
        if TypeInfo^.Kind = tkClass then
        begin
          TypeData := GetTypeData(TypeInfo);
//          ParentName := @TypeData^.ParentInfo^.Name;
//          if (ParentName^ <> TypeInfo^.Name) and
//             (GetClass(ParentName^) <> nil) then { recursive! }
//            GetPropertyNames(GetClass(ParentName^),PropertyNames);
          if TypeData^.PropCount > 0 then
          begin
            PropertyNames.Add(TypeInfo^.Name+':');
            new(PropList);
            GetPropInfos(TypeInfo, PropList);
            for i:=0 to Pred(TypeData^.PropCount) do
              if PropertyNames.IndexOf(PropList^[i]^.Name) < 0 then
                PropertyNames.Add(PropList^[i]^.Name);
            Dispose(PropList)
          end
        end
      end
    end {GetPropertyNames};
  end.


