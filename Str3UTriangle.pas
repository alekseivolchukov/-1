unit UTriangle;

interface

uses
  UFigure, URectangle, SysUtils, Graphics, ExtCtrls, Windows;

type

TTriangle = class(TRectangle)
private
  FThirdPoint: TPoint;
public
  constructor Create(APoint: TPoint; AColor:TColor; ASecondPoint:TPoint;
                     AThirdPoint:TPoint);

  function Area:real; override;
  procedure Draw(Image: TImage); override;


property ThirdPoint:TPoint
read FThirdPoint write FThirdPoint;

end;

implementation

constructor TTriangle.Create(APoint: TPoint; AColor:TColor; ASecondPoint:TPoint;
                             AThirdPoint:TPoint);
begin
  inherited Create(APoint, AColor, ASecondPoint);
  FThirdPoint:= AThirdPoint;
end;

function TTriangle.Area:real;
begin
  Result:= 0.5 * abs((SecondPoint.X - Point.X) * (ThirdPoint.Y - Point.Y) -
                     (ThirdPoint.X - Point.X) * (SecondPoint.Y - Point.Y));
end;

procedure TTriangle.Draw(Image: TImage);
var
  Points: array of TPoint;
begin
  SetLength(Points, 3);
  with Image.Canvas do
    begin
      SetLength(Points, 3);
      Points[0] := Point;
      Points[1] := SecondPoint;
      Points[2] := ThirdPoint;
      Pen.Width := 1;
      Pen.Color := Color;
      Brush.Color := Color;
      Polygon(Points);
    end;
end;

end.
 