
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.10.2/istioctl-1.10.2-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '4b1ed54222791ea7d55277440fb36ce5d9e1ae54e16253a72e676301eac54310'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
