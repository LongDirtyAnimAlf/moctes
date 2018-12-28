unit modelAPI;

{$I Synopse.inc}

interface

uses
  Classes
  , SysUtils
  , mORMot
  , SynCommons
  ;

Type
  { TSQLCliente }

  TSQLCliente = class(TSQLRecord)
  private
    FNombre      : RawUTF8;
    FDireccion   : RawUTF8;
  published
    property Nombre       : RawUTF8 read FNombre       write FNombre;
    property Direccion    : RawUTF8 read FDireccion    write FDireccion;
  end;


function CreateModel( rootName:rawUTF8 ): TSQLModel;

implementation

function CreateModel( rootName:rawUTF8 ): TSQLModel;
begin
  result :=
    TSQLModel.Create([ TSQLAuthGroup, TSQLAuthUser, TSQLCliente], rootName);
end;

end.

