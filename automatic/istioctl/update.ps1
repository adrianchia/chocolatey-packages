﻿import-module au -Force

$releases = 'https://github.com/istio/istio/releases'

function global:au_SearchReplace {
  @{
    'tools\chocolateyInstall.ps1' = @{
      "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
      "(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
    }
  }
}

function global:au_GetLatest {
  $Latest1_12 = getLatestByVersionPrefix -Version "1.12"
  $Latest1_11 = getLatestByVersionPrefix -Version "1.11"
  $Latest1_10 = getLatestByVersionPrefix -Version "1.10"

  @{
    Streams = [ordered] @{
      '1.12' = @{Version = $Latest1_12.Version; URL = $Latest1_12.URL; Checksum32 = $Latest1_12.Checksum32}
      '1.11' = @{Version = $Latest1_11.Version; URL = $Latest1_11.URL; Checksum32 = $Latest1_11.Checksum32}
      '1.10' = @{Version = $Latest1_10.Version; URL = $Latest1_10.URL; Checksum32 = $Latest1_10.Checksum32}
    }
  }
}

function getLatestByVersionPrefix {
    param (
      [string]$Version
    )
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $re  = "istioctl-((?!(alpha|beta|rc)).)+-win.zip"
    $url = $download_page.links | ? href -match $re | ? href -match $Version | select -First 2 -expand href
    $version = $url[0] -split '-' | select -Last 1 -Skip 1
    $url32 = 'https://github.com' + $url[0]

    $checksum_path = "$($pwd)\.$($url[1] -split  '/' | select -Last 1)"
    $checksum_url = 'https://github.com' + $url[1]
    $wc = New-Object net.webclient
    $wc.Downloadfile($checksum_url, $checksum_path)
    $checksum = (Get-Content $checksum_path -First 1) -split ' ' | select -First 1

    $Latest = @{ URL = $url32; Checksum32 = $checksum; Version = $version }
    return $Latest
  }

update -ChecksumFor none
