
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.26.1/istioctl-1.26.1-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '009017a6a3131f89de451e2aba429c6a1257ae5a49f7a714745ee3a030731d08'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
