
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.12.3/istioctl-1.12.3-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '1eaf15db65aef2f6fad41bb61f7524571f9b572a10acbb8373bf8cc4abecb8e0'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
