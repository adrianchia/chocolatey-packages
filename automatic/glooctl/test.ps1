import-module au -Force

$releases = 'https://github.com/solo-io/gloo/releases'

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
    | Select-Object -Property browser_download_url
    $checksum_url = $url[1]
    $checksum_path = "$($pwd)\.$($url[1] -split  '/' | select -Last 1)"
    Write-Output $checksum_path
    $wc = New-Object net.webclient
    $wc.Downloadfile($checksum_url, $checksum_path)
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
