// Copyright (©) Created by Lipatkin Artem
/// Модуль трёхмерной графики
unit Chess3DModule;

{$reference System.Xml.dll}
{$reference HelixToolkit.Wpf.dll}

interface

uses Graph3D;

type 
  FigureColor = (Black,White);
  FigureKind = (BishopK, HorseK, KingK, PownK, QueenK, RockK);

var 
  BlackC := GrayColor(60);
  WhiteC := Colors.White;
  delay := 500;

type ChessFigure = class
  f: FileModelT;
public
  color: FigureColor;
  k: FigureKind;
  x,y: integer;
  constructor Create(kk: FigureKind; cc: FigureColor);
  function MoveTo(xx,yy: integer): ChessFigure;
  function AnimMoveTo(xx,yy: integer): ChessFigure;
  procedure Destroy;
  begin
    f.Destroy;
  end;
end;

function Bishop(x,y: integer; c: FigureColor) : ChessFigure;
function Horse(x,y: integer; c: FigureColor) : ChessFigure;
function King(x,y: integer; c: FigureColor) : ChessFigure;
function Queen(x,y: integer; c: FigureColor) : ChessFigure;
function Rock(x,y: integer; c: FigureColor) : ChessFigure;
function Pown(x,y: integer; c: FigureColor) : ChessFigure;

var a := new ChessFigure[8,8];

procedure MoveFigure(x, y, x1, y1 : integer);

function IsCellFree(x, y: integer): boolean;

implementation

function IsCellFree(x, y: integer): boolean;
begin
  Result := a[x, y] = nil;
end;

constructor ChessFigure.Create(kk: FigureKind; cc: FigureColor);
begin
  color := cc;
  var c := cc=Black ? BlackC : WhiteC;
  case kk of
    bishopK: f := FileModel3D(4,14,0,'bishop.obj',c);
    horseK : f := FileModel3D(2,14,0,'horse.obj',c);
    kingK  : f := FileModel3D(6,14,0,'king.obj',c);
    pownK  : f := FileModel3D(0,12,0,'pawn.obj',c);
    queenK : f := FileModel3D(8,14,0,'queen.obj',c);
    rockK  : f := FileModel3D(0,14,0,'rook.obj',c);
  end;
  k := kk;
end;

function ChessFigure.MoveTo(xx,yy: integer): ChessFigure;
begin
  a[y,x] := nil;
  if a[yy,xx]<>nil then
    a[yy,xx].Destroy;
  a[yy,xx] := Self;
  var dx := xx - x;
  var dy := yy - y;
  f.MoveOn(-dx*2,-dy*2,0);
  (x,y) := (xx,yy);
  Result := Self;
end;

function ChessFigure.AnimMoveTo(xx,yy: integer): ChessFigure;
begin
  var dx := xx - x;
  var dy := yy - y;
  f.AnimMoveOn(-dx*2,-dy*2,0, delay * 1.0 / 1000.0).WhenCompleted(procedure -> begin
    a[y,x] := nil;
    if a[yy,xx] <> nil then
    begin
      a[yy,xx].Destroy;
    end;
    a[yy,xx] := Self;
  end
  ).Begin;
  (x,y) := (xx,yy);
  Result := Self;
end;

function Bishop(x,y: integer; c: FigureColor) := ChessFigure.Create(FigureKind.BishopK,c).MoveTo(x,y);
function Horse(x,y: integer; c: FigureColor) := ChessFigure.Create(FigureKind.HorseK,c).MoveTo(x,y);
function King(x,y: integer; c: FigureColor) := ChessFigure.Create(FigureKind.KingK,c).MoveTo(x,y);
function Queen(x,y: integer; c: FigureColor) := ChessFigure.Create(FigureKind.QueenK,c).MoveTo(x,y);
function Rock(x,y: integer; c: FigureColor) := ChessFigure.Create(FigureKind.RockK,c).MoveTo(x,y);
function Pown(x,y: integer; c: FigureColor) := ChessFigure.Create(FigureKind.PownK,c).MoveTo(x,y);

procedure InitScene;
begin
  var d := 7;
  for var c := '1' to '8' do
  begin
    var s := c +': x';
    var t := Text3D(d,8.5,0,s,0.5);
    t.UpDirection := v3d(0,-1,0);
    d -= 2;
  end;
  d := 7;
  for var c := '1' to '8' do
  begin
    var s := c +': y';
    var t := Text3D(8.4,d,0,s,0.5);
    t.UpDirection := v3d(0,-1,0);
    d -= 2;
  end;
  View3D.ShowGridLines := False;
  var f := FileModel3D(0,0,0,'board.obj',GrayColor(100));
  f.Rotate(OrtZ,90);
end;



procedure cTurn(x,y,x1,y1: integer);
begin
  if a[y,x]=nil then
  begin
    Println('>',y,x);
    exit;
  end;
  
  //Print(a[y,x],a[y1,x1]);
  a[y,x].AnimMoveTo(x1,y1);
  
  //Println('->',a[y,x],a[y1,x1]);
  Sleep(delay + 100);
end;

procedure TurnB(s1,s2: string);
begin
  //Println(s1,s2);
  cTurn(Ord(s1[1])-Ord('a'),s1[2].ToDigit-1,Ord(s2[1])-Ord('a'),s2[2].ToDigit-1);
end;

procedure Turns(s: string);
begin
  var ss := s.ToWords.Batch(3).SelectMany(d->d.ToArray[1:]);
  var i := 0;
  foreach var d in ss do
  begin
    var p := Pos('-',d);
    var p1 := d[:p];
    if Length(p1)=3 then 
      p1 := p1[2:];
    var p2 := d[p+1:];
    if Length(p2)=3 then 
      p2 := p2[2:];
    if (p1 = '0') and (p2 = '0') then
    begin
      if i mod 2 = 0 then
      begin
        TurnB('e1','g1');
        TurnB('h1','f1');
      end
      else
      begin
        TurnB('e8','g8');
        TurnB('h8','f8');
      end
    end
    else TurnB(p1,p2);
    i += 1;
  end;
end;

procedure MoveFigure(x, y, x1, y1 : integer);
begin
  cTurn(x - 1, y - 1, x1 - 1, y1 - 1);
end;

initialization
  InitScene;
end.