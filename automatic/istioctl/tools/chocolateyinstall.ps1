
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.27.3/istioctl-1.27.3-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '7ce1f6ba8bc712b340c4b706374075d1f451ff10708b10823cafd685858cef2e'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
