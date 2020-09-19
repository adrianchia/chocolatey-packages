
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.7.2/istioctl-1.7.2-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '21cb4e9e6b3231a4ef8b03a812151944130db0a9a14d680a7912dc8fce143f65'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
