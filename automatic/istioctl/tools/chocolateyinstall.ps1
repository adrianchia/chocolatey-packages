
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.11.1/istioctl-1.11.1-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '803c882254b07a41e4c36c63a480729a55c2d51e01c9aa9ebb35a2663333d15b'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
