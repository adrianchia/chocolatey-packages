
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.8.0/istioctl-1.8.0-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'e4f63b460db3ab05168d827c5cdeb603da1143e4d4b238ab6c604d84a4f10af3'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
