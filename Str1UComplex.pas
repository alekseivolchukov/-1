unit UComplex;

interface

type
  TComplex = record
    realPart: real;
    imagPart: real;
   end;

// ������������� ������������ �����
function InitComplex(ARealPart, AImagPart: real): TComplex;

// ������ ������������ �����
procedure WriteComplex(z:Tcomplex);

// ������ ������������ �����
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
  write('������� �������� ����� �����: ');
  readln(Result.realPart);
  write('������� ���������� ����� �����: ');
  readln(Result.imagPart);
  write('�� ����� ����������� �����: ');
  WriteComplex(Result);
end;


end.

