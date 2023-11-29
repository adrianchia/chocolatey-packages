
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.18.5/istioctl-1.18.5-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'ecebece701fae96bd97c6417acbb1ed83f6ac23e14e9b03b03c9fac9c6d15208'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
