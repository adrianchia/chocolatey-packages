
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.22.0/istioctl-1.22.0-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '2d385bc1159d3b0ab53ab2647978d2290eede26f0bdda2386006c5ae9886ec84'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
