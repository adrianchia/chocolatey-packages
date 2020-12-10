
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.7.6/istioctl-1.7.6-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '5ddbd858354ff9f9dabe54e7588c350570cb2a3b6a60b03de742586cd492a611'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
