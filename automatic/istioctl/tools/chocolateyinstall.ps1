
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.7.1/istioctl-1.7.1-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'f59d44586a48358eff3562c21699a99a6f978e7e085f3a7427d91bd64cf03fc1'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
