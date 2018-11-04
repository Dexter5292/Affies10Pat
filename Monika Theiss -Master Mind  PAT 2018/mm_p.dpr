program mm_p;

uses
  Vcl.Forms,
  mm_u in 'mm_u.pas' {MasterMind};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMasterMind, MasterMind);
  Application.Run;
end.
