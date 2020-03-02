
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/buildpacks/pack/releases/download/v0.9.0/pack-v0.9.0-windows.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'e95820489bfa7b06cc2376d753df1e9af03e8f350dca8a2f259e8f72152bf708'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
