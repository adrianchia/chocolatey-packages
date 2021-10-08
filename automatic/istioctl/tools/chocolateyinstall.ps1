
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.11.3/istioctl-1.11.3-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'd8fa0e8d1b1b40cabfb41d665c52d69fa6825cd15e9495740a444f403bf3e118'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
