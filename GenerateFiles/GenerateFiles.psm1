$functionsPath = Join-Path $PSScriptRoot "Functions"

# Kontrolli, kas Functions kaust eksisteerib
if (-not (Test-Path $functionsPath)) {
    Write-Error "Functions kaust ei leidu: $functionsPath"
    return
}

# Laadi kõik .ps1 failid
$functionFiles = @(Get-ChildItem $functionsPath -Filter "*.ps1" -ErrorAction SilentlyContinue)

if ($functionFiles.Count -eq 0) {
    Write-Error "Ühtegi funktsioonifaili ei leitud: $functionsPath"
    return
}

foreach ($file in $functionFiles) {
    try {
        . $file.FullName
    }
    catch {
        Write-Error "Viga funktsiooni laadimisel '$($file.Name)': $_"
    }
}

Export-ModuleMember -Function Start-FileGeneration