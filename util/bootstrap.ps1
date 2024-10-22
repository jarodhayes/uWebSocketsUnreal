$VCPKG_BASELINE = '3207386cc93121b907a8c5498a43b7a312f4f55d'

$LocalPath = "${PSScriptRoot}\..\.local"
if (! (Test-Path -Path ${LocalPath})) {
    New-Item -ItemType Directory -Force -Path ${LocalPath} > $null
}

$VcpkgPath = "${LocalPath}\vcpkg"
if (! (Test-Path -Path ${VcpkgPath})) {
    $CurrentPwd = Get-Location
    New-Item -ItemType Directory -Force -Path ${VcpkgPath} > $null
    Set-Location $VcpkgPath > $null
    git init &&
    git remote add origin https://github.com/microsoft/vcpkg.git &&
    git fetch origin $VCPKG_BASELINE &&
    git reset --hard FETCH_HEAD
    Set-Location $CurrentPwd
}
