unit UComplexOperations;

interface

uses
  UComplex;

// Вычисление модуля
function ModulComplex(z:Tcomplex) : real;

// Сумма косплексных чисел
function SumComplex(z1, z2:Tcomplex) : Tcomplex;

// Вычитание комплексных чисел
function MinusComplex(z1, z2:TComplex) : TComplex;

// Умножение комплексных чисел
function MultiplyComplex(z1,z2:Tcomplex) : Tcomplex;

// Деление комплексного числа на обычное
function DivideComplex(z:Tcomplex; x:real) : Tcomplex;

implementation

// Вычисление модуля
function ModulComplex(z:Tcomplex) : real;
begin
  Result := sqrt( sqr(z.realPart) + sqr(z.imagPart) );
end;

// Сумма косплексных чисел
function SumComplex(z1, z2:Tcomplex) : Tcomplex;
begin
  Result.realPart:= z1.realPart + z2.realPart;
  Result.imagPart:= z1.imagPart + z2.imagPart;
end;

// Вычитание комплексных чисел
function MinusComplex(z1, z2:TComplex) : TComplex;
begin
  Result.realPart:= z1.realPart - z2.realPart;
  Result.imagPart:= z1.imagPart - z2.imagPart;
end;

// Умножение комплексных чисел
function MultiplyComplex(z1,z2:Tcomplex) : Tcomplex;
begin
  Result.realPart := z1.realPart * z2.realPart - z1.imagPart * z2.imagPart;
  Result.imagPart := z1.realPart * z2.imagPart + z1.imagPart * z2.realPart;
end;

// Деление комплексного числа на обычное
function DivideComplex(z:Tcomplex; x:real) : Tcomplex;
begin
  Result.realPart := z.realPart / x;
  Result.imagPart := z.imagPart / x;
end;

end.

