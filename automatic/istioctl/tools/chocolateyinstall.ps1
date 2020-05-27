
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.6.0/istioctl-1.6.0-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '9367a6362f43a93e7734e3eda84b3270016aaa8e67a859432a74bf3a87eb031f'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
