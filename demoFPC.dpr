program demoFPC;

uses
  {$I SynDprUses.inc} // includes FastMM4
  Forms, mainAPIServerDev, modelAPI, repoClientes, clientesInterfaces,
  apiClientConect, apisharedtypes, apiclient, apiClientTypes;

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFmainAPIServerDev, FmainAPIServerDev);
  Application.Run;
end.

