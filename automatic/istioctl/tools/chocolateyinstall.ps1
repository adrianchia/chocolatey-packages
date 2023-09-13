
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.18.3/istioctl-1.18.3-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '27a2ff0dac7f9d77de05d2a3520306c6d307e71c8a635bd44ea7d41a61c393d2'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
