
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.13.4/istioctl-1.13.4-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '6390e839ef37d1208ecaa6f3e830a5af9d3ed4047aa176a6c5608e0c9cf8c86c'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
