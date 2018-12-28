unit apiClientTypes;

{$I Synopse.inc}

interface

uses
  Classes
  , SysUtils
  , SynCommons
  ;

Type
  TClientParams = record
    Host : RawUTF8;
    Port : RawUTF8;
    root : RawUTF8;
    enableAuth : Boolean;
  End;

  TResultado = record
    Status : integer;
    Mensaje: string;
    Valor  : Variant;
  End;

  TUsuarioAPI = record
    Usuario: RawUTF8;
    Pass   : RawUTF8;
  end;

implementation

end.

