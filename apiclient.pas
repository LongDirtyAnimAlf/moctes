unit apiclient;

{$I Synopse.inc}

interface

uses
  Classes, SysUtils
  , mORMotHttpClient
  , mORMot
  , mORMotSQLite3
  , clientesInterfaces
  , apiClientTypes
  ;

function RegistrarCliente( usuario: TUsuarioAPI; apiClient:TSQLRestClientURI;
  const datos: TCliente; out IdCliente: Int64; auth: boolean): TResultado;

implementation

function RegistrarCliente( usuario: TUsuarioAPI; apiClient:TSQLRestClientURI;
  const datos: TCliente; out IdCliente: Int64; auth: boolean): TResultado;
var
  servClientes : IClientes;
  resRegistro  : TResRegistroCliente;
begin
  result.Status := -1;
  Try
    Try
      If not apiClient.ServerTimeStampSynchronize then
      Begin
        result.Mensaje := apiClient.LastErrorMessage;
        Exit;
      End;

      if auth then
        //No session started
        if apiClient.SessionID <= 1 then
          apiClient.SetUser(usuario.Usuario, usuario.Pass);

      if apiClient.Services['Clientes'] = nil then
        apiClient.ServiceDefine([IClientes],sicShared);

      if apiClient.Services['Clientes'].Get(servClientes) then
      Begin
        resRegistro := servClientes.RegistrarCliente( datos, IdCliente );
        if resRegistro = rrcExito then
          result.Status := 0
        else
          result.Mensaje := 'Error placeholder.';
      End else
        result.Mensaje := apiClient.LastErrorMessage;
    Except on E: Exception do
      Begin
        result.Mensaje:= e.Message+sLineBreak+apiClient.LastErrorMessage;
      End;
    End;
  Finally
  End;
end;

end.

