
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.7.3/istioctl-1.7.3-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'c762066a3625cd01a300ba97cdb0c1c31f276ad97c908d2c3fad41e264778894'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
