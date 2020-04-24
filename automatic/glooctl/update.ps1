import-module au -Force

$releases = 'https://github.com/solo-io/gloo/releases/latest'


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

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $re  = "\.exe(.sha256)?$"

    $url = $download_page.links | ? href -match $re | select -First 2 -expand href

    $version = (Split-Path ( Split-Path $url[0] ) -Leaf).Substring(1)
    $url64 = 'https://github.com' + $url[0]

    $checksum_path = "$($pwd)\.$($url[1] -split  '/' | select -Last 1)"
    $checksum_url = 'https://github.com' + $url[1]
    $wc = New-Object net.webclient
    $wc.Downloadfile($checksum_url, $checksum_path)
    $checksum = (Get-Content $checksum_path -First 1) -split ' ' | select -First 1

    $Latest = @{
        URL64 = $url64
        Checksum64 = $checksum
        ChecksumType64 = 'sha256'
        Version = $version
        ReleaseURL = 'https://github.com/solo-io/gloo/releases/tag/${version}'
    }
    return $Latest
  }

update -ChecksumFor none
