
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.17.1/istioctl-1.17.1-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '62b6bd34987676a2712bef66a7862f72da7d7a9abd2df3c863845c66de33424c'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
