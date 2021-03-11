
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.8.4/istioctl-1.8.4-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'd100345b46c1bf7c348b062374e461a43e2a5208e6e416847990af37a431ec97'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
