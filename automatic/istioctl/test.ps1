import-module au -Force

$releases = 'https://github.com/istio/istio/releases'

function getLatestByVersionPrefix {
  param (
      [string]$Version
    )
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $release_tag_link = $download_page.links | ? href -match $Version | ? href -match 'releases/tag' | select -First 1 -expand href
    $re  = "istioctl-((?!(alpha|beta|rc)).)+-win.zip"
    $version = $release_tag_link -split '/' | select -Last 1
    # Download release info from api instead of defaut release page
    $api_link = 'https://api.github.com/repos/istio/istio/releases/tags/' + $version
    $url = Invoke-WebRequest -Uri $api_link `
    | ConvertFrom-Json `
    | Select-Object -ExpandProperty assets `
    | Where-Object {$_.name -match $re } `
    | Select-Object -ExpandProperty browser_download_url
    Write-Output $url

}

getLatestByVersionPrefix -Version "1.16"