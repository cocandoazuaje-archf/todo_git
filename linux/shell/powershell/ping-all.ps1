$mihostsFile = "/etc/hosts"

Get-Content $mihostsFile |
Where-Object { $_ -notmatch '^\s*#' -and $_ -notmatch '^\s*$' } |
ForEach-Object {
    $parts = $_ -split '\s+'

    $ip = $parts[0]
    $mihost = $parts[1]

    if (-not $mihost) { return }

    Write-Host "==== Probando $mihost ($ip) ===="

    $result = Test-Connection -ComputerName $ip -Count 3 -Quiet -ErrorAction SilentlyContinue

    if ($result) {
        Write-Host "OK - $mihost responde" -ForegroundColor Green
    } else {
        Write-Host "FAIL - $mihost no responde" -ForegroundColor Red
    }

   # Write-Host "press any key to continue..."
}
