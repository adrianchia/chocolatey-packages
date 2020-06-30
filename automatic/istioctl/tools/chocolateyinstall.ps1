
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.6.4/istioctl-1.6.4-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'b14c0181138dfa0d08c23ff6fedca0e1782ad1dda1121630e6e53b4647ff486b'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
