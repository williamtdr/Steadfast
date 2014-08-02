@echo off
TITLE PocketMine-MP server software for Minecraft: Pocket Edition
cd /d %~dp0
if exist bin\php\php.exe (
	set PHP_BINARY=bin\php\php.exe
) else (
	set PHP_BINARY=php
)

if exist src\PocketMine\PocketMine.php (
	set POCKETMINE_FILE=src\PocketMine\PocketMine.php
) else (
	if exist PocketMine-MP.phar (
		set POCKETMINE_FILE=PocketMine-MP.phar
	) else (
		echo "Couldn't find a valid PocketMine-MP installation"
		pause
		exit 1
	)
)

if exist bin\mintty.exe (
	start "" bin\mintty.exe -o Columns=88 -o Rows=32 -o AllowBlinking=0 -o FontQuality=3 -o Font="DejaVu Sans Mono" -o FontHeight=10 -o CursorType=0 -o CursorBlinks=1 -h error -t "PocketMine-MP" -i bin/pocketmine.ico -w max %PHP_BINARY% -d enable_dl=On %POCKETMINE_FILE% --enable-ansi %*
) else (
	%PHP_BINARY% -d enable_dl=On %POCKETMINE_FILE% %*
)
