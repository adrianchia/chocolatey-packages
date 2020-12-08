
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.6.14/istioctl-1.6.14-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '115a3e52cc5de8c2167b3babf713b7e379a505421804218d0840acc0d78a611d'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
