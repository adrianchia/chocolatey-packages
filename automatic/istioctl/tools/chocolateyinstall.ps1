
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.4.4/istioctl-1.4.4-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'ce039a3739551c43686346498384351a66db2cf9102c09ae4dbeabb1ff85f9ae'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
