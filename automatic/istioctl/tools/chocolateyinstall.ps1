
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.17.3/istioctl-1.17.3-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'f7a2d69eb0d771098dc8a828314f9aef9b3f014c949cea4b707c02cdd67eb88d'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
