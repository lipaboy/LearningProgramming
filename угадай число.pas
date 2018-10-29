var a, b:integer;
begin
  writeln('Угадай за 3 попытки число от 1 до 10');
  a := 1 + random(10);
  b:= 1;
  readln(b);
  if (a = b) then
  begin
    writeln('Угадал');
  end    
  else
  begin
    if (a < b) then
    begin
      writeln('Нет, моё число меньше');
    end     
    else
    begin
      writeln('Нет, моё число больше');
    end;
    
    readln(b);
    if (a = b) then
    begin
      writeln('Ура! Угадал!');
    end
    else
    begin
      if (a < b) then
      begin
        writeln('Нет, моё число меньше');
      end
      else
      begin
        writeln('Нет, моё число больше');
      end;
        
      readln(b);
      if (a = b) then
      begin
        writeln('Ура! Угадал!');
      end
      else
      begin
        writeln('Нет, было задумано ', a);
      end; 
    end;       
  end;
end.