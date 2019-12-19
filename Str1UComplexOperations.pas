unit UComplexOperations;

interface

uses
  UComplex;

// ���������� ������
function ModulComplex(z:Tcomplex) : real;

// ����� ����������� �����
function SumComplex(z1, z2:Tcomplex) : Tcomplex;

// ��������� ����������� �����
function MinusComplex(z1, z2:TComplex) : TComplex;

// ��������� ����������� �����
function MultiplyComplex(z1,z2:Tcomplex) : Tcomplex;

// ������� ������������ ����� �� �������
function DivideComplex(z:Tcomplex; x:real) : Tcomplex;

implementation

// ���������� ������
function ModulComplex(z:Tcomplex) : real;
begin
  Result := sqrt( sqr(z.realPart) + sqr(z.imagPart) );
end;

// ����� ����������� �����
function SumComplex(z1, z2:Tcomplex) : Tcomplex;
begin
  Result.realPart:= z1.realPart + z2.realPart;
  Result.imagPart:= z1.imagPart + z2.imagPart;
end;

// ��������� ����������� �����
function MinusComplex(z1, z2:TComplex) : TComplex;
begin
  Result.realPart:= z1.realPart - z2.realPart;
  Result.imagPart:= z1.imagPart - z2.imagPart;
end;

// ��������� ����������� �����
function MultiplyComplex(z1,z2:Tcomplex) : Tcomplex;
begin
  Result.realPart := z1.realPart * z2.realPart - z1.imagPart * z2.imagPart;
  Result.imagPart := z1.realPart * z2.imagPart + z1.imagPart * z2.realPart;
end;

// ������� ������������ ����� �� �������
function DivideComplex(z:Tcomplex; x:real) : Tcomplex;
begin
  Result.realPart := z.realPart / x;
  Result.imagPart := z.imagPart / x;
end;

end.

