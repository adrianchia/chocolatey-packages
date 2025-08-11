
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.26.3/istioctl-1.26.3-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '178dce5ac7b735718f2b5413094573f9773e6cb86862a3b4627a38923f8fceed'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
