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
  $Latest1_22 = getLatestByVersionPrefix -Version "1.22"
  $Latest1_21 = getLatestByVersionPrefix -Version "1.21"
  $Latest1_20 = getLatestByVersionPrefix -Version "1.20"

  @{
    Streams = [ordered] @{
      '1.22' = @{Version = $Latest1_22.Version; URL = $Latest1_22.URL; Checksum32 = $Latest1_22.Checksum32}
      '1.21' = @{Version = $Latest1_21.Version; URL = $Latest1_21.URL; Checksum32 = $Latest1_21.Checksum32}
      '1.20' = @{Version = $Latest1_20.Version; URL = $Latest1_20.URL; Checksum32 = $Latest1_20.Checksum32}
    }
  }
}

function getLatestByVersionPrefix {
    param (
      [string]$Version
    )
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $release_tag_link = $download_page.links | ? href -match $Version | ? href -match 'releases/tag' | select -First 1 -expand href
    $re  = "istioctl-((?!(alpha|beta|rc)).)+-win.zip"
    #$ReleaseVersion= "releases/" + $Version
    #$url = $download_page.links | ? href -match $Version | ? href -match $ReleaseVersion | select -First 1 -expand href
    #$artifact_page = Invoke-WebRequest -Uri $url
    #$url = $artifact_page.links | ? href -match $re | select -First 2 -expand href
    #$version = $url[0] -split '-' | select -Last 1 -Skip 1
    #$url32 = $url[0]
    $version = $release_tag_link -split '/' | select -Last 1
    # Download release info from api instead of defaut release page
    $api_link = 'https://api.github.com/repos/istio/istio/releases/tags/' + $version
    $url = Invoke-WebRequest -Uri $api_link `
    | ConvertFrom-Json `
    | Select-Object -ExpandProperty assets `
    | Where-Object {$_.name -match $re } `
    | Select-Object -ExpandProperty browser_download_url
    Write-Output $url
    $url32 = $url[0]

    $checksum_path = "$($pwd)\.$($url[1] -split  '/' | select -Last 1)"
    $checksum_url = $url[1]
    $wc = New-Object net.webclient
    $wc.Downloadfile($checksum_url, $checksum_path)
    $checksum = (Get-Content $checksum_path -First 1) -split ' ' | select -First 1

    $Latest = @{ URL = $url32; Checksum32 = $checksum; Version = $version }
    return $Latest
  }

update -ChecksumFor none
