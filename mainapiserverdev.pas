unit mainAPIServerDev;

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons, ActnList
  , SynCommons
  , mORMot
  , servidorAPI
  , apisharedtypes
  , apiClientTypes
  ;


type

  { TFmainAPIServerDev }

  TFmainAPIServerDev = class(TForm)
    Bevel1: TBevel;
    newCustomerBtn: TButton;
    enableAuthChk: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    startStopBtn: TButton;
    procedure startStopBtnClick(Sender: TObject);
    procedure newCustomerBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    Model           : TSQLModel;
    cteAPI          : TSQLRestClientURI;
    ParamsAPIClient : TClientParams;
    ParamsAPIServer : TServerParams;

    server: TServicioHttp;
  public

  end;

var
  FmainAPIServerDev: TFmainAPIServerDev;

implementation

uses
  mORMotHttpClient
  , apiClientConect
  , apiclient
  , clientesInterfaces
  ;

{$ifdef FPC}
  {$R *.lfm}
{$else}
  {$R *.dfm}
{$endif}


{ TFmainAPIServerDev }

procedure TFmainAPIServerDev.startStopBtnClick(Sender: TObject);
begin
  if enableAuthChk.Checked then
  Begin
    ParamsAPIServer.enableAuth := True;
    ParamsAPIClient.enableAuth := True;
  end else
    Begin
      ParamsAPIServer.enableAuth := False;
      ParamsAPIClient.enableAuth := False;
    End;

  if startStopBtn.Caption = 'Start ...' then
  Begin
    server := TServicioHttp.Create(ParamsAPIServer);
    server.Start;
    enableAuthChk.Enabled  := False;
    newCustomerBtn.Enabled := True;
    startStopBtn.Caption   := 'Stop';
  end else
    Begin
      server.Stop;
      enableAuthChk.Enabled  := True;
      newCustomerBtn.Enabled := False;
      startStopBtn.Caption   := 'Start ...';
    End;
end;

procedure TFmainAPIServerDev.newCustomerBtnClick(Sender: TObject);
var
  cliente  : TCliente;
  usuario  : TUsuarioAPI;
  idCliente: Int64;
  res      : TResultado;
begin
  usuario.Usuario   := 'User';
  usuario.Pass      := 'synopse';

  cliente.Nombre    := 'Jane Doe';
  cliente.Direccion := 'Hidalgo 50, Centro, Guadalajara Jalisco Mexico';
  if not assigned(cteAPI) then
    cteAPI := CrearAPIClienteHTTP(false, ParamsAPIClient, Model);

  res := RegistrarCliente(usuario, cteAPI, cliente, IdCliente, ParamsAPIClient.enableAuth);
  if res.Status = -1 then
    ShowMessage(res.Mensaje)
  else
    ShowMessage('Numero de cliente asignado: '+IdCliente.ToString);
end;

procedure TFmainAPIServerDev.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  if Assigned(server) then
    server.Stop;
end;

procedure TFmainAPIServerDev.FormCreate(Sender: TObject);
var
  curdir: RawUTF8;
begin
  //Server Config
  curdir              := IncludeTrailingPathDelimiter(GetCurrentDir);
  ForceDirectories(IncludeTrailingPathDelimiter(curdir+'data'));
  ParamsAPIServer.archivoDB := IncludeTrailingPathDelimiter(curdir+'data')+'data.db';
  ParamsAPIServer.Host      :='';
  ParamsAPIServer.Port      :='4100';
  ParamsAPIServer.root      :='rootapi';

  //Client Config
  ParamsAPIClient.Host      :='localhost';
  ParamsAPIClient.Port      :='4100';
  ParamsAPIClient.root      :='rootapi';

end;

procedure TFmainAPIServerDev.FormDestroy(Sender: TObject);
begin
  if Assigned(server) then
    server.Free;
end;

end.

