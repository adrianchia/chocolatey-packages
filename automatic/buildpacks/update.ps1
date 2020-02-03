import-module au -Force

$releases = 'https://github.com/buildpacks/pack/releases/latest'

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
  $re  = "pack-((?!(alpha|beta|rc)).)+-windows.zip"

  $url = $download_page.links | ? href -match $re | select -First 1 -expand href

  $version = ($url -split '-' | select -Last 1 -Skip 1).TrimStart('v')
  $url32 = 'https://github.com' + $url

  $Latest = @{ URL = $url32; Version = $version }
  return $Latest
}

update -ChecksumFor 32
