
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.7.7/istioctl-1.7.7-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'cedfe2002e85b83c80afceb35ab7c2fd7228158e67df4eedf3e80218af7f6723'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
