
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.9.4/istioctl-1.9.4-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '793f69a6443b8111b9bc1fa6a87cd5ad8f109298da9a0f1b8d515aebd497392d'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
