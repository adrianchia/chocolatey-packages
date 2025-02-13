
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.22.8/istioctl-1.22.8-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '04e245ad72471813e1ec7abf410aed6fa1a2fd3b95c73f4832f9ce8d2f7c9795'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
