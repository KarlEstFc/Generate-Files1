# Peamine funktsioon failide genereerimiseks
function Start-FileGeneration {
    param (
        [Parameter(Mandatory=$false)]
        [ValidateRange(1,1000)]
        [int]$FileCount = 15
    )

    $targetFolder = "Loodud_Failid"

    # Loo kaust kui puudub
    if (-not (Test-Path $targetFolder)) {
        Write-Host "Loome kausta: $targetFolder" -ForegroundColor Cyan
        New-Item -ItemType Directory -Path $targetFolder | Out-Null
    }

    $baseNames = Get-BaseNames
    $extensions = Get-Extensions

    Write-Host "Genereerin $FileCount unikaalset faili..." -ForegroundColor Green

    $createdFiles = @()

    while ($createdFiles.Count -lt $FileCount) {

        $randomName = Get-Random $baseNames
        $randomExt = Get-Random $extensions

        $fileName = "{0}_{1}{2}" -f $randomName, (Get-Random -Minimum 1 -Maximum 9999), $randomExt
        $fullPath = Join-Path $targetFolder $fileName

        # Väldi duplikaate
        if (-not (Test-Path $fullPath)) {
            New-Item -ItemType File -Path $fullPath | Out-Null
            $createdFiles += $fileName
        }
    }

    Write-Host "Valmis! $FileCount faili loodud kausta '$targetFolder'." -ForegroundColor Green
}