
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.4.3/istioctl-1.4.3-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'df7e03d2052f754185ce5739c148531c32bc4dd0af94102250080c0e40204c6c'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
