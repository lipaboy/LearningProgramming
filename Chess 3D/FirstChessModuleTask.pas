// Copyright (©) Created by Lipatkin Artem
/// Модуль
unit FirstChessModuleTask;   // must be the same as file name (without extension)

{$reference System.Xml.dll}
{$reference HelixToolkit.Wpf.dll}

interface

uses Chess3DModule;

implementation

procedure StartupPosition;
begin
    Pown(3,1,White);
    Pown(4,5,Black);
end;

initialization
  
  StartupPosition;
end.