
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.24.1/istioctl-1.24.1-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'e398d4a416d6e1eca7d7e118457d7e9560bdae5bc231da184f48a5a03ebbfd9a'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
