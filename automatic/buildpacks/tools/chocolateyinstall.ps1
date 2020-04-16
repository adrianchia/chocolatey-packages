
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/buildpacks/pack/releases/download/v0.10.0/pack-v0.10.0-windows.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '022f9dfe34ea1d0719271a1a516bc24e2bf0c558271a5eab2317a1202aa4694b'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
