
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.28.2/istioctl-1.28.2-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '81c7b60bf2dc12bbf14615f9689ff7c0f6e04fe7784ca867c431428984ed6739'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
