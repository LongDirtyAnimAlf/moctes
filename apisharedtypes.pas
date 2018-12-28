unit apisharedtypes;

{$I Synopse.inc}

interface

uses
  Classes
  , SysUtils
  , SynCommons
  ;

Type
  TServerParams = record
    Host       : RawUTF8;
    Port       : RawUTF8;
    archivoDB  : RawUTF8;
    UsuarioDB  : RawUTF8;
    passDB     : RawUTF8;
    root       : RawUTF8;
    enableAuth : Boolean;
  End;

implementation

end.

