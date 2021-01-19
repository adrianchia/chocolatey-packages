
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.8.2/istioctl-1.8.2-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '0ef510436c047315bbdd99138e8ac3bd03697e0090aa9e47b6362ce9e52b8f02'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
