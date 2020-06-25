
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.5.6/istioctl-1.5.6-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '679e1edd8512c5c9e5cc973a6d2ff210b4cd5f8f9820eb16617c6dac11dc29f4'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
