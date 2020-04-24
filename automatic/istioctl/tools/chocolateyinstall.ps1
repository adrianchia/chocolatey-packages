
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.5.2/istioctl-1.5.2-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'fc51f359e0f1fac928f0526404a260b3fa5fd37d89cabf6d201793cbbfe091e8'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
