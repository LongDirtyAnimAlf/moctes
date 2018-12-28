unit apiClientConect;

{$ifdef FPC}
{$mode delphi}{$H+}
{$endif}
{$I Synopse.inc}

interface

uses
  Classes
  , SysUtils
  , mORMotHttpClient
  , apiClientTypes
  , apisharedtypes
  , mORMot
  ;

function CrearAPIClienteHTTP( https: Boolean; paramsSrv: TClientParams; out Modelo: TSQLModel ):TSQLHttpClient;

implementation

uses
  modelAPI
  ;

function CrearAPIClienteHTTP( https: Boolean; paramsSrv: TClientParams; out Modelo: TSQLModel ):TSQLHttpClient;
begin
  if https then
    // Puerto del Servidor
    // Dejar el valor en CERO para que mORMot
    // decida segun corresponda a HTTP (80) o HTTPS (443)
    paramsSrv.Port  := '0';
  Modelo := CreateModel( paramsSrv.root );
  result := TSQLHttpClient.Create( paramsSrv.Host, paramsSrv.Port, Modelo, https);
  //cteMovil := TSQLHttpClient.Create(srvMovil,puertoSvr,Model,https)

end;

end.

