unit UCircle;

interface

uses
  UFigure, SysUtils, Graphics, ExtCtrls, Windows;
const
  Pi = 3.1415;

type

TCircle = class(TFigure)
private
  FRadius: integer;
public
  constructor Create(APoint: TPoint; AColor:TColor; ARadius:integer);
  function Area:real; override;
  procedure Draw(Image: TImage); override;
  class function WhatItIs:string; override;

property radius:integer
read FRadius write FRadius;

end;

implementation

class function TCircle.WhatItIs:string;
begin
  Result:= 'Круг';
end;

constructor TCircle.Create(APoint: TPoint; AColor:TColor; ARadius:integer);
begin
  inherited Create(APoint, AColor);
  FRadius:= ARadius;
end;

function TCircle.Area:real;
begin
  Result:= Pi * sqr(radius);
end;

procedure TCircle.Draw(Image: TImage);
begin
  Image.Canvas.Brush.Color:= Color;
  Image.Canvas.Ellipse(point.X - radius, point.Y - radius,
                       point.X + radius, point.Y + radius);
end;

end.
 