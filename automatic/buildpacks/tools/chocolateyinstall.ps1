
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/buildpacks/pack/releases/download/v0.11.2/pack-v0.11.2-windows.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '418d0967d9393e0d628e1b3084c3980678002b725736b29ae60547142a269a77'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
