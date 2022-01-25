unit uManage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,  Manager.Core,
  Model.BaseClass, Model.Demo;

type
  TfrmManage = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManage: TfrmManage;

  Ferrari1: TFerrari;
  Ferrari2: TFerrari;
  Porshe0: TPorsche;
  Chrysler0: TChrysler;

  Manager: TManager;

implementation

{$R *.dfm}

procedure TfrmManage.Button1Click(Sender: TObject);
begin
  Ferrari1 := Manager.Make<TFerrari>(TFerrari);
  Memo1.Lines.Add('Ferrari1 ' + Ferrari1.Design);
  Ferrari2 := Manager.Make<TFerrari>(TFerrari, False);
  Memo1.Lines.Add('Ferrari2 ' + Ferrari2.Design);
end;

procedure TfrmManage.FormCreate(Sender: TObject);
begin
  Manager := TManager.Create;
end;

procedure TfrmManage.FormDestroy(Sender: TObject);
begin
  FreeAndNil(Manager);
end;

end.

