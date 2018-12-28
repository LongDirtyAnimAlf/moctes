unit repoClientes;

{$I Synopse.inc}

interface

uses
  Classes, SysUtils
  , mORMot
  , SynCommons
  , mORMotSQLite3
  , clientesInterfaces
  ;

Type

  { TClientesAdmon }
  TClientesAdmon = class(TInterfacedObject, IClientes)
  protected
    fRest: TSQLRestServerDB;
  public
    constructor Create( ORM: TSQLRestServerDB ); reintroduce;
    function RegistrarCliente( const {%H-}datos: TCliente; out IdCliente: Int64): TResRegistroCliente;
  end;

implementation

{ TClientesAdmon }

constructor TClientesAdmon.Create(ORM: TSQLRestServerDB);
begin
  inherited Create;
  fRest := ORM;
end;


function TClientesAdmon.RegistrarCliente(const datos: TCliente; out IdCliente: Int64
  ): TResRegistroCliente;
begin
  IdCliente := 1;
  result    := rrcExito;
end;


end.

