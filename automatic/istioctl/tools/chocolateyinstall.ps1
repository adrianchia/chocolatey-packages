
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.7.5/istioctl-1.7.5-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '70356b46dab340240e185648f70a8114e7d992e3ddeb9858a9d21112212324b5'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
