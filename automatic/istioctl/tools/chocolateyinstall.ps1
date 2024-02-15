
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.20.3/istioctl-1.20.3-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '4cb0ebcca89e73272a3957e94d236601c6ba8ece667416f743d2875a3d8c4d9e'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
