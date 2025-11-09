
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.28.0/istioctl-1.28.0-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '1a3253df1c49598442a2503dda3aac9e2e89be3ab31d7de30110197475b521c6'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
