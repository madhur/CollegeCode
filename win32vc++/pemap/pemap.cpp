<html>
<body>
<pre>
<h1>Build Log</h1>
<h3>
--------------------Configuration: pemap - Win32 Debug--------------------
</h3>
<h3>Command Lines</h3>
Creating temporary file "D:\DOCUME~1\madhur\LOCALS~1\Temp\RSP2C.tmp" with contents
[
/nologo /MLd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /Fp"Debug/pemap.pch" /Yu"stdafx.h" /Fo"Debug/" /Fd"Debug/" /FD /GZ /c 
"H:\PROGRAMS\WIN32VC\pemap\pemap.cpp"
]
Creating command line "cl.exe @D:\DOCUME~1\madhur\LOCALS~1\Temp\RSP2C.tmp" 
Creating temporary file "D:\DOCUME~1\madhur\LOCALS~1\Temp\RSP2D.tmp" with contents
[
kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:yes /pdb:"Debug/pemap.pdb" /debug /machine:I386 /out:"Debug/pemap.exe" /pdbtype:sept 
.\Debug\pemap.obj
.\Debug\StdAfx.obj
]
Creating command line "link.exe @D:\DOCUME~1\madhur\LOCALS~1\Temp\RSP2D.tmp"
<h3>Output Window</h3>
Compiling...
pemap.cpp
H:\PROGRAMS\WIN32VC\pemap\pemap.cpp(14) : warning C4200: nonstandard extension used : zero-sized array in struct/union
H:\PROGRAMS\WIN32VC\pemap\pemap.cpp(44) : error C2664: 'skip_dos_stub' : cannot convert parameter 1 from 'void *' to 'const struct _IMAGE_DOS_HEADER *'
        Conversion from 'void*' to pointer to non-'void' requires an explicit cast
H:\PROGRAMS\WIN32VC\pemap\pemap.cpp(69) : error C2562: 'skip_dos_stub' : 'void' function returning a value
        H:\PROGRAMS\WIN32VC\pemap\pemap.cpp(7) : see declaration of 'skip_dos_stub'
H:\PROGRAMS\WIN32VC\pemap\pemap.cpp(73) : error C2562: 'skip_dos_stub' : 'void' function returning a value
  