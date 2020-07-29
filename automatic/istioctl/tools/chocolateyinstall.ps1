
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.6.6/istioctl-1.6.6-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'cf97f5476f57fbdb49bfd319b437f5819bb9acf29041ed0383810171bb87c9c7'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
