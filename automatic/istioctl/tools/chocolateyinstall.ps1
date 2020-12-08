
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.8.1/istioctl-1.8.1-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'e8f6d6968edf8076865e5baed84c1a6f99ad4b43342e344c74f5b31d99ef529e'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
