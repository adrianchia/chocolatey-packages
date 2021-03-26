
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.9.2/istioctl-1.9.2-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '7537ee3dd507d4fdd3cb8fe7ef95e75ea0dcbd0efdf6592f6cc27a7c507b1678'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
