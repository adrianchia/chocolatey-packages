
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/buildpacks/pack/releases/download/v0.11.0/pack-v0.11.0-windows.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '31ad54e6bd1b0d898cd22687c47366c5295b26d8f67b0285426e8e86c01c5a28'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
