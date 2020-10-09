
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.6.12/istioctl-1.6.12-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '13384905bac8597946cc14686a3bf62a8a3b2a4cd37f2e0c9fef177a1b424d56'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
