.all: \
  HWITER.DLL

HWITER.res: \
    $*.RC \
    $*.ico \
    $*.ih \
    $*.rh \
    $*.MAK
         rc.exe -r $*.RC $*.RES

HWITER.c: \
    $*.idl \
    $*.MAK
      sc.exe -C128000 -S128000 $*.IDL

HWITER.obj: \
    $*.c \
    $*.ih \
    $*.rh \
    $*.MAK
         icc.exe /Q /Wcnddcleffgeniniobsordparprorearettruuse /Fi /Si /O /Gm /Ge- /C %s

HWITER.DLL: \
    $*.obj \
    $*.res \
    {$(LIB)}OS2386.lib \
    {$(LIB)}SOMTK.lib \
    $*.DEF \
    $*.MAK
      link386.exe @<<
         /PM:PM /F /PACKD: /E:2 /NOI /NOLOGO /A:4 +
        $*.obj
        $*.DLL
        
        OS2386 +
        SOMTK
        $*.DEF;
<<
      rc.exe -x2 $*.res $*.DLL
