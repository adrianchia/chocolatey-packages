
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.17.0/istioctl-1.17.0-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'a82888126b045d61f239308d453cda5ce72fb55125efca9ecef38fa9d6f98b40'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
