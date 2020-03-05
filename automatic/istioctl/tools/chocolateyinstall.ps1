
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.5.0/istioctl-1.5.0-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '594428dec5a544e59ce341d08c0406206f5270b6e70af3161cbae59239e1c200'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
