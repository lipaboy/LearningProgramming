// подключаем графику
uses graphABC;

var
  doodler : picture;

begin
  // устанавливаем название окна (то, что будет написано в заголовке окна) 
  // #необязательная строчка кода
  window.Caption := 'Lol';
  // установить размер окна (ширина и высота в пикселях)
  // можно поиграться с чиселками)
  SetWindowSize(552, 850);
  doodler := picture.Create('doodler.png');
  
  doodler.
end.