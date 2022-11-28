@ECHO OFF

@REMtaskkill /IM vsClone.exe /F

@REM SET linksCLANG= -luser32.lib
@REM clang src/win32_platform.cpp -o simpleTD.exe %linksCLANG%

@REM call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"

SET includesCL=/Ithird_party
SET definesCL=/D DEBUG /D GAME
SET linksCL=/link user32.lib Shell32.lib opengl32.lib gdi32.lib
cl /nologo /std:c++20 /Zc:strictStrings- /FC src/win32_platform.cpp /Z7 /FevsClone.exe %definesCL% %includesCL% %linksCL%

cl /nologo /std:c++20 /Zc:strictStrings- /LD /FC src/game.cpp  %definesCL%

copy game.dll game_load.dll

@REM Play sound to indicate Building is completed
powershell -c (New-Object Media.SoundPlayer ".\assets\sounds\building-completed.wav").PlaySync()