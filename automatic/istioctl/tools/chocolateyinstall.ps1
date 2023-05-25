
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.17.2/istioctl-1.17.2-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '53bac58968e345bae6c6efd306d3a4c66034bbb44beec1b25eebbc78f757aec3'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
