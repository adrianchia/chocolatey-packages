
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.22.2/istioctl-1.22.2-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '104c34b4b0ae22251a4b691ca87e59ed1656487b83582e36643805aa61641089'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
