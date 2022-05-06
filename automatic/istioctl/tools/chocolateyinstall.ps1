
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.13.3/istioctl-1.13.3-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '354290c122b38d17ec3151f02ebe8d3ccca8868f167c2fd6e834486f8993430f'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
