import-module au -Force

$releases = 'https://github.com/solo-io/gloo/releases'


function global:au_BeforeUpdate {
    Get-RemoteFiles -Purge -NoSuffix -FileNameBase "glooctl"
}


function global:au_SearchReplace {
    @{
      ".\legal\VERIFICATION.txt" = @{
        "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$($Latest.ReleaseURL)>"
        "(?i)(^\s*software.*)\<.*\>"        = "`${1}<$($Latest.URL64)>"
        "(?i)(^\s*checksum\s*type\:).*"     = "`${1} $($Latest.ChecksumType64)"
        "(?i)(^\s*checksum\:).*"            = "`${1} $($Latest.Checksum64)"
      }
    }
  }

function global:au_GetLatest {

    $Latest1_17 = getLatestByVersionPrefix -Version "1.17"
    $Latest1_16 = getLatestByVersionPrefix -Version "1.16"

    @{
      Streams = [ordered] @{
        '1.17' = @{Version = $Latest1_17.Version; URL64 = $Latest1_17.URL64; Checksum64 = $Latest1_17.Checksum64; ChecksumType64 = $Latest1_17.ChecksumType64; ReleaseURL = $Latest1_17.ReleaseURL}
        '1.16' = @{Version = $Latest1_16.Version; URL64 = $Latest1_16.URL64; Checksum64 = $Latest1_16.Checksum64; ChecksumType64 = $Latest1_16.ChecksumType64; ReleaseURL = $Latest1_16.ReleaseURL}
      }
    }
  }

function getLatestByVersionPrefix {
  param (
      [string]$Version
    )
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $release_tag_link = $download_page.links | ? href -match $Version | ? href -match 'releases/tag' | select -First 1 -expand href
    $re  = "\.exe(.sha256)?$"
    $version = $release_tag_link -split '/' | select -Last 1
    $version_without_v = $version -split 'v' | select -Last 1
    # Download release info from api instead of defaut release page
    $api_link = 'https://api.github.com/repos/solo-io/gloo/releases/tags/' + $version
    $url = Invoke-WebRequest -Uri $api_link `
    | ConvertFrom-Json `
    | Select-Object -ExpandProperty assets `
    | Where-Object {$_.name -match $re } `
    | Select-Object -ExpandProperty browser_download_url
    Write-Output $url
    $checksum_url = $url[1]
    $checksum_path = "$($pwd)\$(Split-Path -Leaf $checksum_url)"
    Invoke-WebRequest $checksum_url -Outfile $checksum_path
    $checksum = (Get-Content $checksum_path -First 1) -split ' ' | select -First 1
    
    $Latest = @{
        URL64 = $url[0]
        Checksum64 = $checksum
        ChecksumType64 = 'sha256'
        Version = $version_without_v
        ReleaseURL = 'https://github.com/solo-io/gloo/releases/tag/${version}'
    }
    return $Latest

}

update -ChecksumFor none
