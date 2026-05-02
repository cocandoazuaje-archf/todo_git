Set-Alias not notepad.exe
 Set-Alias exp explorer.exe
 Set-Alias chis history
 Set-Alias not notepad.exe
 Set-Alias ll dir
 Set-Alias it Get-Item
 Set-Alias ch Get-ChildItem 
 Set-Alias pr Get-Process
 function lb {
    Get-ChildItem | ForEach-Object {
        if ($_.PSIsContainer) {
            # Carpeta
            $sizeDisplay = "<DIR>"
        } else {
            # Archivo → tamaño en MB
            $sizeMB = [math]::Round($_.Length / 1MB, 2)
            $sizeDisplay = "$sizeMB MB"
        }
        # Mostrar: Nombre, Tamaño, Última modificación
        "{0,-30} {1,10} {2}" -f $_.Name, $sizeDisplay, $_.LastWriteTime
    }
}
       function ho(){
        cd $HOME
       }
    

   
    function u {
        Set-Location C:\Users\cox
}

function z {
    Compress-Archive -Path ./* -DestinationPath $HOME/todoshell.zip -Force
}
function un {
    Expand-Archive -Path ".\todoshell.zip" -DestinationPath ".\respaldo" -Force
}
function up {
    winget upgrade --all --accept-source-agreements --accept-package-agreements --include-unknown
}
function ver {
    Get-ComputerInfo | Select-Object OsName, OsVersion, OsBuildNumber, OsArchitecture | Format-List
}
Set-Alias off Stop-Computer 
set-alias ll dir

function r2 { Set-Location \ }

