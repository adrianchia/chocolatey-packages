
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.9.1/istioctl-1.9.1-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'a9d19f307540d74ff7cf3dc2d918eaac5b5fb227902373860890218dd49ba741'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
