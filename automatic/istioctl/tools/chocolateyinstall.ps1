
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.6.13/istioctl-1.6.13-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '9d9f8505cc4b23c1444529fc375a73fe57c0bb60c10c56d6ca5f2c6b63645329'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
