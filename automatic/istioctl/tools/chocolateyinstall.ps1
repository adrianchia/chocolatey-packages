
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.5.10/istioctl-1.5.10-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '825e774009103b123d5283faf1dc13a8340827aedbd0bb97ee09b188e6ee99bf'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
