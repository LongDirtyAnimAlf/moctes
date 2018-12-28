program demoFPC;

uses
  {$I SynDprUses.inc} // includes FastMM4
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, mainAPIServerDev, modelAPI, repoClientes, clientesInterfaces,
  apiClientConect, apisharedtypes, apiclient, apiClientTypes;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TFmainAPIServerDev, FmainAPIServerDev);
  Application.Run;
end.

