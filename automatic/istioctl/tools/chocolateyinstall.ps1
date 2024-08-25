
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.22.4/istioctl-1.22.4-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '7cc8e2c6b6ccd195d93ebe2272350b02bad9c42254d1f35994fe30621939958a'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
