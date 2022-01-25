unit Model.BaseClass;

interface

uses
  Vcl.Graphics;

type

  TCar = class
    function Power: Integer; virtual; abstract;
    function Design: string; virtual; abstract;
    function Color: TColor; virtual; abstract;
  end;

implementation

end.
