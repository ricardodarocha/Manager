unit Manager.Core;

interface

uses
  Generics.Collections,
  Entidade.Core;

type

  TEntidadeClass = class of TEntidade;

  TManager = class
    FList: TObjectList<TEntidade>;
    constructor Create;
    destructor Destroy; override;

    function Make<T: TEntidade>(AConstrutor: TEntidadeClass; const ARecicle: boolean = true): T;

  end;

implementation

uses
  System.SysUtils;

{ TManager }

constructor TManager.Create;
begin
  FList := TObjectList<TEntidade>.Create;
end;

destructor TManager.Destroy;
begin
  inherited;
  FreeAndNil(FList);
end;

function TManager.Make<T>(AConstrutor: TEntidadeClass; const ARecicle: boolean): T;
var
  Ent: TEntidade;
begin
  Result := nil;
  if ARecicle then
  begin
    for Ent in FList do
    begin
      if Ent is T then
      begin
        Result := T(Ent);
        Break;
      end;
    end;

    if Result = nil then
    begin
      Result := T(AConstrutor.Create);
      FList.Add(Result)
    end;
  end else
  begin
    Result := T(AConstrutor.Create);
    FList.Add(Result)
  end;

end;

end.
