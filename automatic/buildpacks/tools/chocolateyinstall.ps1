
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/buildpacks/pack/releases/download/v0.8.1/pack-v0.8.1-windows.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '7521815af2220fda3a22836e70de89ce795d60decadc87a2452ae48efe9c117f'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
