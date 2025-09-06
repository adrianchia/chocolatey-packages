
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.27.1/istioctl-1.27.1-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '1bd414b27ed4cd1c319ca0f9812157810b9c7e417170aeed0da608e4e72f428d'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
