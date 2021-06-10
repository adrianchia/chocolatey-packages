
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.10.1/istioctl-1.10.1-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'aefa43b8ab8458d91db0479afe82d6e84ee12f062b0a514aacfb1b902f2bc0d5'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
