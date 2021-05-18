
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.10.0/istioctl-1.10.0-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '022d2be133822d23bfcd566f5530a4222f6b587be1f3552fef9e49e76d9b406d'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
