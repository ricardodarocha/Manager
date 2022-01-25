program pManager;

uses
  Vcl.Forms,
  uManage in 'uMain.pas' {frmManage},
  Manager.Core in 'Manager.Core.pas',
  Model.BaseClass in 'Model.BaseClass.pas',
  Model.Demo in 'Model.Demo.pas';

{$R *.res}

begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := true;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmManage, frmManage);
  Application.Run;
end.
