$ErrorActionPreference = "Stop"
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8

$RepositoryRoot = Split-Path -Parent $PSScriptRoot
$ManifestPath = Join-Path $RepositoryRoot "SHA256SUMS.txt"

if (-not (Test-Path -LiteralPath $ManifestPath -PathType Leaf)) {
    throw "SHA256SUMS.txt was not found."
}

$Failures = @()
$VerifiedCount = 0

foreach ($Line in Get-Content -LiteralPath $ManifestPath -Encoding UTF8) {
    if ([string]::IsNullOrWhiteSpace($Line) -or $Line.StartsWith("#")) {
        continue
    }

    if ($Line -notmatch "^([0-9a-fA-F]{64})\s+\*(.+)$") {
        $Failures += "Malformed hash entry: $Line"
        continue
    }

    $ExpectedHash = $Matches[1].ToLowerInvariant()
    $RelativePath = $Matches[2].Replace("/", [IO.Path]::DirectorySeparatorChar)
    $TargetPath = Join-Path $RepositoryRoot $RelativePath

    if (-not (Test-Path -LiteralPath $TargetPath -PathType Leaf)) {
        $Failures += "Missing file: $RelativePath"
        continue
    }

    $ActualHash = (Get-FileHash -LiteralPath $TargetPath -Algorithm SHA256).Hash.ToLowerInvariant()
    if ($ActualHash -ne $ExpectedHash) {
        $Failures += "Hash mismatch: $RelativePath"
        continue
    }

    Write-Host "OK  $RelativePath  $ActualHash"
    $VerifiedCount++
}

if ($Failures.Count -gt 0) {
    foreach ($Failure in $Failures) {
        Write-Error $Failure
    }
    throw "Verification failed with $($Failures.Count) problem(s)."
}

Write-Host "Verification successful: $VerifiedCount file(s) match SHA256SUMS.txt."
