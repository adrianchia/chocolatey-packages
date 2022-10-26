
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://storage.googleapis.com/istio-release/releases/1.15.2/istioctl-1.15.2-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '035f2cb282f08b06897013c2bfbd7a9d24f7e04372b6d765cba22d0e091b47ff'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
