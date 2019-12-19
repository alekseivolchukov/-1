unit UFigure;

interface

uses
  SysUtils, Graphics, Forms, ExtCtrls, Windows;

type

TFigure = class
private
  FPoint: TPoint;
  FColor: TColor;
public
  constructor Create(APoint: TPoint; AColor:TColor);
  function Area:real; virtual;
  procedure Draw(Image: TImage); virtual; abstract;
  function Contains(p: TPoint):boolean; virtual;
  class function WhatItIs:string; virtual;

property point:TPoint
read FPoint write FPoint;
property color:TColor
read FColor write FColor;

end;

implementation

class function TFigure.WhatItIs:string;
begin
  Result:= 'Фигура';
end;

function InitPoint(X, Y:integer):TPoint;
begin
  Result.X:= X;
  Result.Y:= Y;
end;

constructor TFigure.Create(APoint: TPoint; AColor:TColor);
begin
  FPoint:= APoint;
  FColor:= AColor;
end;

function TFigure.Area:real;
begin
  Result:= 0;
end;

function TFigure.Contains(p: TPoint):boolean;
begin
  Result:= false;
end;

end.
 