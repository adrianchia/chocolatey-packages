
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.7.0/istioctl-1.7.0-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '26ef74d33e018c91eacb06f2f0e81a3293e43b612c0c6dc14b2f216d1ed82c0c'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
