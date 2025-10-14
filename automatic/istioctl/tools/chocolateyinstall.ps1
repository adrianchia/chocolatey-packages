
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.27.2/istioctl-1.27.2-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '9badb7423073c6f54d966361abd54adc51a58f3bcf6b3bacca3275b3ae8e5d6e'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
