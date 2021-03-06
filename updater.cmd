@echo off
TITLE  SpigotPE Updater
cd /d %~dp0

if exist bin\php\php.exe
       echo "wow! You are using a old veraion of php update your php to 'php7'"

if exist bin\7\php.exe (
	set PHPRC=""
	set PHP_BINARY=bin\php\php.exe
) else (
	set PHP_BINARY=php
)

if exist src\pocketmine\updater\Updater.php (
	set UPDATER=src\pocketmine\updater\Updater.php
) else (
	echo "sorry but we couldn't find the Apollo Updater file"
	pause
	exit 1
)

REM if exist bin\php\php_wxwidgets.dll (
REM 	%PHP_BINARY% %UPDATER% --enable-gui %*
REM ) else (
	if exist bin\mintty.exe (
		start "" bin\mintty.exe -o Columns=130 -o Rows=32 -o AllowBlinking=0 -o FontQuality=3 -o Font="DejaVu Sans Mono" -o FontHeight=10 -o CursorType=0 -o CursorBlinks=1 -h error -t "SpigotPE-Updater" -i bin/pocketmine.ico %PHP_BINARY% %UPDATER% --enable-ansi %*
	) else (
		%PHP_BINARY% -c bin\php %UPDATER% %*
	)
REM )
