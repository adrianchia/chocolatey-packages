
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.27.0/istioctl-1.27.0-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'e9cc3bd4602c6586861c97bc78dd05db4722905b9df9b4610c82068a6dd9cebf'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
