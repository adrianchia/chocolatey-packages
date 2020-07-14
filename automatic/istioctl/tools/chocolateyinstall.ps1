
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.6.5/istioctl-1.6.5-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'c42d02d1819c7df17c961630424cc47a169e3f94bd9229f0a534409557585ed0'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
