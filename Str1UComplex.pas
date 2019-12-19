unit UComplex;

interface

type
  TComplex = record
    realPart: real;
    imagPart: real;
   end;

// Инициализация комплексного числа
function InitComplex(ARealPart, AImagPart: real): TComplex;

// Печать комплексного числа
procedure WriteComplex(z:Tcomplex);

// Чтение комплексного числа
function ReadComplex(txt:string):TComplex;

implementation

function InitComplex;
begin
  Result.realPart := ARealPart;
  Result.imagPart := AImagPart;
end;

procedure WriteComplex;
begin
  if (z.imagPart < 0) then
    write(z.realPart:0:2, ' - ', -z.imagPart:0:2, 'i')
  else
    write(z.realPart:0:2, ' + ', z.imagPart:0:2, 'i');
  writeln;
end;

function ReadComplex;
begin
  if txt <> '' then
    writeln(txt);
  write('Введите реальную часть числа: ');
  readln(Result.realPart);
  write('Введите комплексую часть числа: ');
  readln(Result.imagPart);
  write('Вы ввели комплескное число: ');
  WriteComplex(Result);
end;


end.

