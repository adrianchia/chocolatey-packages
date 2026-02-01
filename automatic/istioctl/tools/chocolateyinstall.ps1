
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.28.3/istioctl-1.28.3-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'c2ef4e427f19b72adecc05cf512a2aa85224cdd5aa7e78ec1b33017b31f74b14'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
