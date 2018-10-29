var d, m, g, d2, m2, g2 :integer;
begin

  g := Random(1, 2019);
  m := Random(1, 12);
  
  if ((m <= 6) and (m mod 2 = 0) or (m mod 2 = 1)) then
  begin
    d := Random(1, 30);
    
    g2 := g;
    if (d = 30) then
    begin
      d2 := 1;
      m2 := m + 1;
    end
    else
    begin
      d2 := d + 1;
      m2 := m;
    end;
  end
  else
  begin
    d := Random(1, 31);
    
    g2 := g;
    if (d = 31) then
    begin
      if (m = 12) then
      begin
        d2 := 1;
        m2 := 1;
        g2 := g + 1;
      end
      else
      begin
        d2 := 1;
        m2 := m + 1;
      end;       
    end
    else
    begin
      d2 := d + 1;
      m2 := m;
    end;
  end;
 
  if ((m = 2) and (g mod 4 = 0) and (d > 29) or (m = 2) and (d > 28)) then
  begin
    writeln('Ошибка');
  end
  else
  begin
    writeln(d2, '-', m2, '-', g2);
  end;

end.