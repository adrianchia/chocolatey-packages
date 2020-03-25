
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.5.1/istioctl-1.5.1-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'dfbc570579b547f3186ef914f56ee9c25f0071b2a3fafd69c8860964f3d91903'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
