
$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/istio/istio/releases/download/1.4.5/istioctl-1.4.5-win.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '440a874939ca6b2c6197c8817c96a485a162a373d145fdce80534816513a5661'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
