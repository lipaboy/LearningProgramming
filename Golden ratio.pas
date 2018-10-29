begin
  var F: real;
  var i: integer;
  F := 1;
  for i := 1 to 100 do
  begin
    F := 1 + Sqrt(F);
  end;
  F := Sqrt(F);
  writeln(F * F - F);
end.