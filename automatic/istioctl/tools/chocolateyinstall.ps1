
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.9.0/istioctl-1.9.0-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '3f22b7c41b106ff66b0d5f05a896e1aede032dc5cb40ecbde1fd796d802fef69'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
