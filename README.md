# Manager
This is a Lite version of TManager
Leia o artigo em pt-br
https://medium.com/p/56614626cc65

# Criando um Manager para TEntidade

Gerenciar o ciclo de vida dos componentes é uma tarefa árdua e repetitiva, e muitas vezes esquecemos de criar e destruir os componentes corretamente, causando vazamento de memória e até perda de dados.

Eu implementei uma classe **TManager** em Delphi, para gerenciar o ciclo de vida de forma automática.

**unit Manager.Core**
```Delphi
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
  Result := T(AConstrutor.Create);
  FList.Add(Result)
end;
```

Assim, em vez de gerenciar o ciclo de vida de todas as variáveis **TEntidade**, é mais simples gerenciar uma única instância de **TManager**,
e deixar que o Manager destrua automaticamente toda a lista de objetos `TList<TEntidade>` que ele criar.

Para utilizar o TManager deverá ser utilizada a seguinte sintaxe

**Sintaxe antiga, sem TManager**
```Delphi
var
  Empresa: TEmpresa;
begin
  Empresa := TEmpresa.Create;
  try
    TCrudBuilder.Connect(DmConexao.Con)
      .Open(Empresa, nil, 'Empresa ').Show;
  finally
    FreeAndNil(Empresa)
  end;
```

**Sintaxe nova, com TManager**
```Delphi
  TCrudBuilder
    .Connect(DmConexao.Con)
    .Open(Manager.Make<TEmpresa> (TEmpresa) , nil, 'Empresa ')
    .Show;
```

## Uma sutil diferença

**Sintaxe antiga, sem TManager**
```Delphi
  var Empresa1 := TEmpresa.Create;
  try
    ..
  finally
    FreeAndNil(Empresa1);
  end;
```
No formato padrão é obrigatório gerenciar o ciclo de vida da variável Empresa1, caso contrário será gerado um memory Leak

**Sintaxe nova, com TManager**
```Delphi
CONST RECYCLE = TRUE;
var Manager := TManager.Create;
  try
    var Empresa1 := Manager.Make<TEmpresa> (TEmpresa, RECYCLE);
    var Empresa2 := Manager.Make<TEmpresa> (TEmpresa, RECYCLE);
    var Empresan := Manager.Make<TEmpresa> (TEmpresa, RECYCLE);
  finally
    FreeAndNil(Manager);
  end;
```
No formato novo, você precisará gerenciar o ciclo de vida do **Manager**, mas não precisará mais gerenciar as variáveis Empresa1, Empresa2, Empresan;

**Gerenciando a memória**
No Exemplo acima, as variáveis irão compartilhar o mesmo endereço de memória
```
    Empresa1 = Empresa2 = Empresan
```

Ao utilizar o TManager n vezes, o método Make irá retornar sempre a mesma variável, isto é, mantendo apenas uma instância do objeto na memória.
Para forçar a criação de **n** instâncias deverá ser atribuído o parâmetro `Recicle=False`

**Criar novas instâncias**
```Delphi
var Manager := TManager.Create;
  try
    var Empresa1 := Manager.Make<TEmpresa> (TEmpresa, not RECYCLE);
    var Empresa2 := Manager.Make<TEmpresa> (TEmpresa, not RECYCLE);
    var Empresa3 := Manager.Make<TEmpresa> (TEmpresa, not RECYCLE);
  finally
    FreeAndNil(Empresa1);
  end;
```
```
    Empresa1 ≠ Empresa2 ≠ Empresa3
```
