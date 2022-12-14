
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://storage.googleapis.com/istio-release/releases/1.15.4/istioctl-1.15.4-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '129bf4aa1caa454219d22111bc148308fbf9011a0b06525527b8a0359d122a73'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
