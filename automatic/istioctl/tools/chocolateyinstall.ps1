
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.5.4/istioctl-1.5.4-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '5d9fb6162663a05cac3c5b01098c661c4cab2f2cd570424c8d7c7b8e1e513400'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
