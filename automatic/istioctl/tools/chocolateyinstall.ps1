
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.6.1/istioctl-1.6.1-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '3f09371586c4637217ced51371e84f0e4ce9cfdf00afeadd655f4e8cc11fbdc7'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
