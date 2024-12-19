
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.24.2/istioctl-1.24.2-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'cdbf594586dab8ff4128af3bc95c0d69b25c70abf6fa3808c59b0c3c0635cafb'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
