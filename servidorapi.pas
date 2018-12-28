unit servidorAPI;

{$I Synopse.inc}

interface

uses
  Classes,
  //Dialogs,
  SysUtils
  , mORMot
  , mORMotSQLite3
  , SynSQLite3Static
  , mORMotHttpServer
  , SynCommons
  , repoClientes
  , SynLog
  , apisharedtypes
  ;

const
  pdad        = '2l1dm18903q3s*zad4r_ftiw';
  pdsup       = '8l9su48903r3s*zap4r+klcq';
  pdusn       = '7l3us98903s3s*zan4r*vxhy';

Type
  { TServicioHttp }
  TServicioHttp = class
  private
    fParams : TServerParams;
    fRest   : TSQLRestServerDB;
    fModel  : TSQLModel;
    procedure CreaORM;
  public
    ServidorHTTP: TSQLHttpServer;
    constructor Create( paramsServer: TServerParams ); reintroduce;
    procedure Start;
    procedure Stop;
  End;


implementation

uses
  mORMotDB
  , SynSQLite3
  , modelAPI
  , clientesInterfaces
  ;



{ TServicioHttp }

procedure TServicioHttp.CreaORM;
begin
  fModel               := CreateModel(fParams.root);
  fRest                := TSQLRestServerDB.Create(fModel, fParams.archivoDB, fParams.enableAuth);
  fRest.Model.Owner    := fRest;
  fRest.DB.Synchronous := smOff;
  fRest.DB.LockingMode := lmExclusive;
  fRest.CreateMissingTables;
  if fRest.ServiceRegister(TClientesAdmon.Create(fRest),[TypeInfo(IClientes)])=nil then
  begin
    //ShowMessage('Could not register client interface');
  end;
end;


constructor TServicioHttp.Create(paramsServer: TServerParams);
begin
  inherited Create;
  fParams := paramsServer;
end;

procedure TServicioHttp.Start;
begin
  if ServidorHTTP <> nil then
    Stop;

  CreaORM;
  ServidorHTTP := TSQLHttpServer.Create( fParams.Port, [TSQLRestServer(fRest)]);
  ServidorHTTP.AccessControlAllowOrigin := '*';
end;

procedure TServicioHttp.Stop;
begin
  if ServidorHTTP = nil then
    exit;

  ServidorHTTP.Shutdown;
  FreeAndNil(ServidorHTTP);
  FreeAndNil(fRest);
end;

end.

