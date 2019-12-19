unit UStackUtils;

interface

uses
  UStack,
  SysUtils;

//������� �����
procedure ClearStack(var s:Tstack);
//�������������� ����� � ������
function StackToStr(var s:Tstack):string;
//������� ���� ��������� ����� � ������ ����
function MoveAll(var s1:Tstack; var s2:Tstack):integer;
//����������� n �������ov �� ����� � ������ ����
procedure MoveN(var s1, s2:Tstack; n:integer);

function NextWord( str:string; var i:integer):string;

function TryStrToStack (str : string; var S: TStack): boolean;

implementation

//������� �����
procedure ClearStack;
begin
  while not IsEmpty(s) do
    pop(s);
end;

//�������������� ����� � ������
function StackToStr;
var
  hs:Tstack;
  el:Telem;
begin
  Init(hs);
  result:='';
  While TryPop(s, el) do
    begin
      result:=IntToStr(el) + ' ' + result;
      push(hs, el);
    end;
  While TryPop(hs, el) do
    Push(s, el);
end;

//������� ���� ��������� ����� � ������ ����
function MoveAll;
var
  el:Telem;
begin
  result:=0;
  While TryPop(s1, el) do
    begin
      Push(s2, el);
      inc(Result);
    end;
end;

//����������� ������ �������� �� ����� � ������ ����
procedure MoveN;
var
  el:Telem;
  k:integer;
begin
  k:=0;
  While (k<n) and tryPop(s1, el) do
    begin
      Push(s2, el);
      inc(k);
    end;
end;

function NextWord (str : string; var i : integer): string;
var
  len:integer;
begin
  result:= '';
  len:= length(str);
  while (i<=len) and (str[i]=' ') do
    inc(i);
  while (i<=len) and (str[i]<>' ') do
    begin
      result:=result+str[i];
      inc(i);
    end;
end;

function TryStrToStack (str : string; var S: TStack): boolean;
var
  i,len, el :integer;
  wrd:string;
begin
  Init(S);
  str:=Trim(str);
  len:=length(str);
  i:=1;
  Result:=true;
  while (i<=len) and Result do
    begin
      wrd:=NextWord(str, i);
      if TryStrToInt(wrd, el) then
        Push(S, el)
      else
        Result:=false
    end;
  if not Result then
    ClearStack(S)
end;


end.
