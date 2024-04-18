
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.20.5/istioctl-1.20.5-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'b9db90f6d58fe8627a1c1190e239bce3f3a9d8fde52b1800691d6869d5fe957e'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
