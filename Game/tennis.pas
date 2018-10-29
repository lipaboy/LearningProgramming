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
  var duration, t : integer;

procedure pusk();

begin

  // Создаём объекты сцены
  // Первая рокетка:
  //              координаты---------длина рокетки--ширина-высота-цвет
  roketka1 := Box(0,GRANIZA_Y2-1, 0.5, DLINA_ROKETKA, 1,     1,     Colors.Orange);
  roketka2 := Box(0,GRANIZA_Y1+1, 0.5, DLINA_ROKETKA, 1,     1,     Colors.Green);
  ball :=  Sphere(0, 0, 0.5, BALL_RADIUS,                 Materials.Rainbow);
  
  // Присваиваем событию "Нажатие клавиши" определённое действие
  OnKeyDown := k -> 
    case k of
      Key.Left:
        if (roketka1.X < GRANIZA_X1) then
          roketka1.MoveOn(1,0,0);
      Key.Right: 
        if (roketka1.X > GRANIZA_X2) then
          roketka1.MoveOn(-1,0,0);
      Key.A: 
        if (roketka2.X < GRANIZA_X1) then
          roketka2.MoveOn(1,0,0);
      Key.D: 
        if (roketka2.X > GRANIZA_X2) then
          roketka2.MoveOn(-1,0,0);
    end;
  
  sleep(1000);
  
  duration := 10;
  vx := 0.02;
  vy := 0.03;
  t := 0;
  
  // 1 способ
  
//  while (true) do
//  begin
//    sleep(duration);
//    pusk();
//  end;
  
  // 2 способ
  
  var t1 := new Timer(duration, pusk);
  t1.Start;
  
end.

procedure pusk();
begin
    ball.X := ball.X + vx * t / 1000.0;
    ball.Y := ball.Y + vy * t / 1000.0;
    
    if (ball.X >= GRANIZA_X1) then
    begin
      vx := -vx;
      ball.X := GRANIZA_X1;
    end;
    if (ball.X <= GRANIZA_X2) then
    begin
      vx := -vx;
      ball.X := GRANIZA_X2;
    end;
    if (ball.Y >= GRANIZA_Y1) then
    begin
      vy := -vy;
      ball.Y := GRANIZA_Y1;
    end;
    if (ball.Y <= GRANIZA_Y2) then
    begin
      vy := -vy;
      ball.Y := GRANIZA_Y2;
    end;
    
    t := Milliseconds - t;
end;