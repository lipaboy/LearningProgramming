uses Graph3D, Timers;

// константы (инварианты или неизменяемые переменные)
const 
DLINA_ROKETKA = 3;
BALL_RADIUS = 0.5;
GRANIZA_X1 = 5;
GRANIZA_X2 = -5;
GRANIZA_Y1 = 5;
GRANIZA_Y2 = -5;

// переменные
var roketka1, roketka2 : BoxT;
var ball : SphereT;
var vx, vy, speed, ugol : real;
var duration : integer;
var t1,t2 : Timer;
var shN, shA :integer;

procedure pusk();
begin
  ball.X := ball.X + vx;
  ball.y := ball.y + vy;
  if (ball.X >= 5) or (ball.X <= -5) then
  begin
    vx := -vx;
  end;
  if (ball.y >= 5) or (ball.y <= -5)then
  begin
    vy := -vy;
  end;
  
  if (ball.y <= -5)and(roketka1.x + DLINA_ROKETKA / 2 > ball.X) and (roketka1.x - DLINA_ROKETKA / 2 < ball.X) then
  begin
    shN += 1;
    writeln(shA, ':', shN);
  end;
   if (ball.y >= 5)and(roketka2.x + DLINA_ROKETKA / 2 > ball.X) and (roketka2.x - DLINA_ROKETKA / 2 < ball.X) then
  begin
    shA += 1;
    writeln(shA, ':', shN);
    end;
  
  if (shA>5) then 
    writeln('Артем проиграль');
end;

procedure kek();
begin
  vx := vx + random(-1, 1) / 100;
  vy := vy + random(-1, 1) / 100;
  
  vx := vx * 1.01;
  vy := vy * 1.01;
end;

begin

  // Создаём объекты сцены
  // Первая рокетка:
  //              координаты-------------длина рокетки--ширина-высота-цвет
  roketka1 := Box(0,GRANIZA_Y2-0.8, 0.5, DLINA_ROKETKA, 1,     1,     Colors.Orange);
  roketka2 := Box(0,GRANIZA_Y1+0.8, 0.5, DLINA_ROKETKA, 1,     1,     Colors.Green);
  ball :=  Sphere(0, 0, 0.5, BALL_RADIUS,                 Materials.Rainbow);
  
  // Присваиваем событию "Нажатие клавиши" определённое действие
  OnKeyDown := k -> 
    case k of
      Key.Up:
      begin
        if (roketka1.X < GRANIZA_X1) then
          roketka1.MoveOn(1,0,0);
      end;
      Key.Down:
      begin
        if (roketka1.X > GRANIZA_X2) then
          roketka1.MoveOn(-1,0,0);
      end;
      Key.W: 
        if (roketka2.X < GRANIZA_X1) then
          roketka2.MoveOn(1,0,0);
      Key.S: 
        if (roketka2.X > GRANIZA_X2) then
          roketka2.MoveOn(-1,0,0);
    end;
    
    
//    sleep(2000);
  
  duration := 20;
  vx := 0.06 * 1;
  vy := 0.06;
  shN := 0;
  shA := 0;

  // 2 способ
  
  t1 := new Timer(duration, pusk);
  t1.Start;
  t2 := new Timer(200, kek);
  t2.Start;
  
end.