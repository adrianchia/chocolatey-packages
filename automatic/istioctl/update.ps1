import-module au -Force

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

  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $re  = "istioctl-((?!(alpha|beta|rc)).)+-win.zip"

  $url = $download_page.links | ? href -match $re | select -First 2 -expand href

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
