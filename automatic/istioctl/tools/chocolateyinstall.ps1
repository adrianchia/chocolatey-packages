
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.6.3/istioctl-1.6.3-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '96fc2a129518019848498d9ea647b7c8e503f264f84c41a453498f756e19f79a'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
