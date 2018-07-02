#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

;https://www.mobafire.com/images/reforged-rune/biscuit-delivery.png

#include <File.au3>
#include <IE.au3>
#include <INet.au3>
#include <MsgBoxConstants.au3>
#include <WinAPISys.au3>
#include <String.au3>

$file = @ScriptDir & '\Runler.txt'
FileOpen($file, 0)

Global $runlistesi[_FileCountLines($file)]

For $i = 1 to _FileCountLines($file)
    $line = FileReadLine($file, $i)
$runlistesi[$i - 1] = $line
Next
FileClose($file)




For $m = 1 To _FileCountLines($file)-1
$runlistesi[$m] = StringReplace($runlistesi[$m], " ", "-")
$runlistesi[$m] = StringLower($runlistesi[$m])
$FileURL = 'https://www.mobafire.com/images/champion/square/'& $runlistesi[$m] &'.png'
$FileName = @ScriptDir & '\' & $runlistesi[$m] &'.png'
$FileSize = InetGetSize($FileURL)
InetGet($FileURL,$FileName,0,1)
ProgressOn("","")

Next
ProgressOff()
Exit