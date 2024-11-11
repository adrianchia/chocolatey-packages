
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.24.0/istioctl-1.24.0-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '2ee99ccc26c88481b01175d59a2876535ced94c3dc46291a7c59dc0435dd5f20'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
