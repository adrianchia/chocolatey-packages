
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/buildpacks/pack/releases/download/v0.13.1/pack-v0.13.1-windows.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '3db9ca2a64ab26761a0e746c15d0f2585467ab197866ddc90bfdb237a0797174'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
