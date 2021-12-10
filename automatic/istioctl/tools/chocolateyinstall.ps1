
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.11.5/istioctl-1.11.5-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '4520f653acc2b6209eb24e6c238ddb24711047a432b2c8d5418286a4f74dd3ab'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
