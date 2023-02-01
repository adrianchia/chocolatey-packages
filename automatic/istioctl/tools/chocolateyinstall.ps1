
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://storage.googleapis.com/istio-release/releases/1.15.5/istioctl-1.15.5-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'e899788b06d310c0da4ed698e66cec64741f0a4f6487f6cacbd0585dfef5c06c'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
