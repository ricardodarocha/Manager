unit Model.BaseClass;

interface

uses
  Vcl.Graphics, Entidade.Core;

type

  TCar = class(TEntidade)
    function Power: Integer; virtual; abstract;
    function Design: string; virtual; abstract;
    function Color: TColor; virtual; abstract;
  end;

implementation

end.
