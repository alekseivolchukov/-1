unit UMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, UFigure, UCircle, URectangle, UTriangle;

const
  MaxN = 100;

type
  TMainForm = class(TForm)
    image: TImage;
    rgFig: TRadioGroup;
    lbPoint: TLabel;
    edPoint: TEdit;
    lbSecondPoint: TLabel;
    edSecondPoint: TEdit;
    lbColor: TLabel;
    cbColor: TComboBox;
    lbThirdPoint: TLabel;
    edThirdPoint: TEdit;
    btAdd: TButton;
    btExit: TButton;
    btClear: TButton;
    btArea: TButton;
    btCircles: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btExitClick(Sender: TObject);
    procedure CircleSelected;
    procedure RectangleSelected;
    procedure TriangleSelected;
    procedure ClearEdits;
    procedure rgFigClick(Sender: TObject);
    procedure btAddClick(Sender: TObject);
    procedure DrawFigures;
    procedure ClearImage;
    procedure edPointKeyPress(Sender: TObject; var Key: Char);
    procedure btClearClick(Sender: TObject);
    procedure btAreaClick(Sender: TObject);
    procedure btCirclesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  FigureArray: array[0..MaxN - 1] of TFigure;
  count: integer;

implementation

{$R *.dfm}

procedure TMainForm.ClearImage;
var
  rect: TRect;
begin
  Rect.Left:=0;
  Rect.Top:=0;
  Rect.Right:=Image.Width;
  Rect.Bottom:=Image.Height;
  Image.Canvas.Brush.Color:=clWhite;
  image.Canvas.FillRect(rect);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  ClearImage;
  count:= 0;
  rgFig.ItemIndex:= 0;
  cbColor.ItemIndex:= 0;
end;

procedure TMainForm.ClearEdits;
begin
  edThirdPoint.Clear;
  edPoint.Clear;
  edSecondPoint.Clear;
end;

procedure TMainForm.CircleSelected;
begin
  ClearEdits;
  lbSecondPoint.Caption:= 'Радиус';
  lbThirdPoint.Visible:= false;
  edThirdPoint.Visible:= false;
end;

procedure TMainForm.RectangleSelected;
begin
  ClearEdits;
  lbSecondPoint.Caption:= 'Вторая точка';
  lbThirdPoint.Visible:= false;
  edThirdPoint.Visible:= false;
end;

procedure TMainForm.TriangleSelected;
begin
  ClearEdits;
  lbSecondPoint.Caption:= 'Вторая точка';
  lbThirdPoint.Visible:= true;
  lbThirdPoint.Caption:= 'Третья точка';
  edThirdPoint.Visible:= true;
end;

procedure TMainForm.btExitClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.rgFigClick(Sender: TObject);
begin
  case rgFig.ItemIndex of
    0: CircleSelected;
    1: RectangleSelected;
    2: TriangleSelected;
  end;
end;

function NextWord(Str:string; var i:integer):string;
var
  len:integer;
begin
  len:= Length(Str);
  Result:= '';
  while (i<=len) and (Str[i] = ' ') do
    inc(i);
  while (i<=len) and (Str[i] <> ' ') do
    begin
      Result:= Result + Str[i];
      inc(i);
    end;
end;

function TryGetPoint(Str:string; var Point:TPoint):boolean;
var
  i, X, Y:integer;
begin
  i:= 1;
  Result:= TryStrToInt(NextWord(Str, i), X) and (X >= 0) and
           TryStrToInt(NextWord(Str, i), Y) and (Y >= 0);
  if Result then
    begin
      Point.X:= X;
      Point.Y:= Y;
    end;
end;

procedure TMainForm.DrawFigures;
var
  i:integer;
begin
  ClearImage;
  for i:=0 to count - 1 do
    FigureArray[i].Draw(Image);
end;

procedure TMainForm.btAddClick(Sender: TObject);
var
  Point, SecondPoint, ThirdPoint:TPoint;
  Color:TColor;
  radius: integer;
begin
  Color:= clWhite;
  case cbColor.ItemIndex of
    0: Color:= clRed;
    1: Color:= clGreen;
    2: Color:= clBlue;
    3: Color:= clYellow;
    4: Color:= clBlack;
  end;
  case rgFig.ItemIndex of
    0:
      begin
        if TryGetPoint(edPoint.Text, Point) and
           TryStrToInt(edSecondPoint.Text, radius) and (radius > 0) then
          begin
            FigureArray[count]:= TCircle.Create(Point, Color, radius);
            inc(count);
          end
        else
          ShowMessage('Проверьте данные!');
      end;
    1:
      begin
        if TryGetPoint(edPoint.Text, Point) and
           TryGetPoint(edSecondPoint.Text, SecondPoint) then
          begin
            FigureArray[count]:= TRectangle.Create(Point, Color, SecondPoint);
            inc(count);
          end
        else
          ShowMessage('Проверьте данные!');
      end;
    2:
      begin
        if TryGetPoint(edPoint.Text, Point) and
           TryGetPoint(edSecondPoint.Text, SecondPoint) and
           TryGetPoint(edThirdPoint.Text, ThirdPoint) then
          begin
            FigureArray[count]:= TTriangle.Create(Point, Color, SecondPoint, ThirdPoint);
            inc(count);
          end
        else
          ShowMessage('Проверьте данные!');
      end;
  end;
  DrawFigures;
end;

procedure TMainForm.edPointKeyPress(Sender: TObject; var Key: Char);
begin
  if not(key in ['0'..'9', ' ', #127, #8]) then
    key:= #0;
end;

procedure TMainForm.btClearClick(Sender: TObject);
begin
  count:= 0;
  ClearEdits;
  DrawFigures;
end;

procedure TMainForm.btAreaClick(Sender: TObject);
var
  i:integer;
  sum:real;
begin
  sum:= 0;
  for i:=0 to count - 1 do
    sum:= sum + FigureArray[i].Area;
  ShowMessage('Общая сумма всех площадей: ' + FloatToStr(sum));
end;

procedure TMainForm.btCirclesClick(Sender: TObject);
var
  i, j:integer;
  OK:boolean;
begin
  i:= 0;
  OK:= false;
  while (i < count) and not OK do
    begin
      j:= 0;
      if FigureArray[i].WhatItIs = 'Круг' then
        while (j < count) and not OK do
          begin
            OK:= FigureArray[j].Contains(FigureArray[i].point);
            inc(j);
          end;
      inc(i);
    end;
  if OK then
    ShowMessage('Есть прямоугольники, которые содержат круг')
  else
    ShowMessage('Нет прямоугольников, которые содержат круг');
end;

end.
