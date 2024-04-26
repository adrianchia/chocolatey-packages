
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.21.2/istioctl-1.21.2-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '893f627e2a2ff78a95366c0492c21f6d01c5ec32e09ef924176213ebfa280638'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
