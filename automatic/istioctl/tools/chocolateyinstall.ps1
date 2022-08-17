
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.13.7/istioctl-1.13.7-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '75a29b9770013805146b96e8cdcc516e45fe2958e9bbfc02fd560e95c934c01d'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
