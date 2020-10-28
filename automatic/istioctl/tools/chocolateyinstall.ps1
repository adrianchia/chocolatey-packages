
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.7.4/istioctl-1.7.4-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'c599368967a9e617077dfe72ee5b0e1f0d3e7f02aa477bab83e397838ed8c59e'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
