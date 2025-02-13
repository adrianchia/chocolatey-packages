
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.23.5/istioctl-1.23.5-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '75c5c664f2956fff91893c1adb8479077488f596d4f4d84f5df3a42f639a5d05'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
