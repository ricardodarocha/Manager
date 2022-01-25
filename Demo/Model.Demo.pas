unit Model.Demo;

interface

uses
  Vcl.Graphics,
  Model.BaseClass,
  Entidade.Core;

type

  TCar = class(TEntidade)

  end;

  TFerrari = class(TCar)
    function Power: Integer; override;
    function Design: string; override;
    function Color: TColor; override;
  end;

  TPorsche = class(TCar)
    function Power: Integer; override;
    function Design: string; override;
    function Color: TColor; override;
  end;

  TChrysler = class(TCar)
    function Power: Integer; override;
    function Design: string; override;
    function Color: TColor; override;
  end;

implementation

function TChrysler.Color: TColor;
begin
  Result := clYellow;
end;

function TChrysler.Design: string;
begin
  Result := 'CHRYSLER';
end;

function TChrysler.Power: Integer;
begin
  Result := 300;
end;

{ TPorsche }

function TPorsche.Color: TColor;
begin
  Result := ClBlue;
end;

function TPorsche.Design: string;
begin
  Result := 'Porsche';
end;

function TPorsche.Power: Integer;
begin
  Result := 444;
end;

{ TFerrari }

function TFerrari.Color: TColor;
begin
  Result := ClRed;
end;

function TFerrari.Design: string;
begin
  Result := 'Ferrari';
end;

function TFerrari.Power: Integer;
begin
  Result := 660;
end;



end.
