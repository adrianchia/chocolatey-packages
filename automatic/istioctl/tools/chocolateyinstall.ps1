
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.11.2/istioctl-1.11.2-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'f80dc7fb567b4d49545ffef9a6c71fd2d6f8a1c000ecc737c192b24864724d95'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
