
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.8.3/istioctl-1.8.3-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '4046b22a2d6204093aa36f2599c474f165e43f6d86760ce1ad5a1e70b6aaf9d0'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
