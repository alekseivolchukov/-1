unit URectangle;

interface

uses
  UFigure, SysUtils, Graphics, ExtCtrls, StdCtrls, Windows, Math;

type

TRectangle = class(TFigure)
private
  FSecondPoint: TPoint;
public
  constructor Create(APoint: TPoint; AColor:TColor; ASecondPoint:TPoint);
  function Area:real; override;
  procedure Draw(Image: TImage); override;
  function Contains(p: TPoint):boolean; override;
  class function WhatItIs:string; override;

property SecondPoint:TPoint
read FSecondPoint write FSecondPoint;

end;

implementation

constructor TRectangle.Create(APoint: TPoint; AColor:TColor; ASecondPoint:TPoint);
begin
  inherited Create(APoint, AColor);
  FSecondPoint:= ASecondPoint;
end;

class function TRectangle.WhatItIs:string;
begin
  Result:= 'Прямоугольник';
end;

function TRectangle.Area:real;
begin
  Result:= abs((SecondPoint.Y - Point.Y) * (SecondPoint.X - Point.X));
end;

procedure TRectangle.Draw(Image: TImage);
var
  Rect: TRect;
begin
  Rect.TopLeft:= Point;
  Rect.BottomRight:= SecondPoint;
  Image.Canvas.Brush.Color:= Color;
  image.Canvas.FillRect(rect);
end;

function TRectangle.Contains(p: TPoint):boolean;
begin
  Result:= (p.X > Point.X) and (p.Y > Point.Y) and
           (p.X < SecondPoint.X) and (p.Y < SecondPoint.Y);
end;

end.
 