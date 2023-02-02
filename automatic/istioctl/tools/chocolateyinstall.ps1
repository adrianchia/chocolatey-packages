
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.16.2/istioctl-1.16.2-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '0524bbe4bcb025785866bd2a114f77de8fad0b75264d8b3fc77923e74cf0ab1c'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
