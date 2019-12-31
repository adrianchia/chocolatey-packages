
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.4.2/istioctl-1.4.2-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '51fbab5ca89d32f02dfb0fc6e158bba0b16bf53577b423e18bfd0088447368fc'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
