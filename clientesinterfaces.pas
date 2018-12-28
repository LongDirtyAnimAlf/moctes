unit clientesInterfaces;

{$I Synopse.inc}

interface

uses
  Classes
  , SysUtils
  , modelAPI
  , SynCommons
  , mORMot
  ;

Type
  TResRegistroCliente = (rrcExito, rrcFaltanDatos, rrcDatoInvalido, rrcYaExiste, rrcErrorDeBaseDeDatos);
  TResBusquedaCliente = (rbcNoEncontrado, rbcEncontrado);

  { TCliente }

  TCliente = packed record
    ID           : Int64;
    Nombre       : RawUTF8;
    Direccion    : RawUTF8;
  end;

  IClientes = interface(IInvokable)
    ['{F257828F-6432-4546-B47E-A7B9E6D65469}']
    function RegistrarCliente( const datos: TCliente; out IdCliente: Int64): TResRegistroCliente;
  end;


implementation

initialization
Begin
  TInterfaceFactory.RegisterInterfaces([TypeInfo(IClientes)]);
End;

end.

