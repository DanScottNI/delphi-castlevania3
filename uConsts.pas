unit uConsts;

interface

type
  TObjDetect = record
    ObjType : Integer;
    ObjIndex : Integer;
  end;

const

  CRLF : String =  #13#10;
  MAPEDITINGMODE : Byte = 0;
  OBJEDITINGMODE : Byte = 1;
  ENEMYEDITINGMODE : Byte = 2;
  // Object Types
  NONETYPE : Byte = 0;
  STAIRTYPE : Byte = 1;
  DOORTYPE : Byte = 2;
  ENTRANCETYPE : Byte = 3;
  SPECOBJTYPE : Byte = 4;
  VERTICALENEMYTYPE : Byte = 5;
  // Special Objects
  SPECOBJCRUMBLINGBRIDGE : Byte = $00;
  SPECOBJTILTINGLEDGE : Byte = $01;
  SPECOBJTRAPDOOR : Byte = $02;
  SPECOBJTRAPDOORWITHSPIKES : Byte = $03;
  SPECOBJLARGECOG : Byte = $04;
  SPECOBJPENDULUM : Byte = $05;
  SPECOBJMOVINGSPIKES : Byte = $06;
  SPECOBJCRUSHER : Byte = $07;
  SPECOBJFALLINGBLOCKS : Byte = $08;
  SPECOBJACIDDROPS : Byte = $09;
  SPECOBJSMALLCOG : Byte = $0A;
  SPECOBJVERTICALPLATFORM : Byte = $0B;
  SPECOBJHORIZONTALPLATFORM : Byte = $0C;
  SPECOBJSCROLLINGLEDGE : Byte = $0D;
  SPECOBJBREAKABLEBLOCK : Byte = $10;
  SPECOBJBREAKABLEBLOCKV : Byte = $11;
  // The bits for the drawing routine.
  DRAWSTAIRS : Byte = $1;
  DRAWENTRANCES : Byte = $2;
  DRAWDOORS : Byte = $4;
  DRAWSPECIALOBJECTS : Byte = $8;
  DRAWVERTICALENEMIES : Byte = $10;
  DRAWBLACKBAR : Byte = $80;
  // Open dialog settings
  OPD_CUSTOM : Byte = 0;
  OPD_STANDARD : Byte = 1;
  NUMENEDISP : Integer = 5;
implementation

end.
