Write-Host "Starting Installation Steps"

Write-Host "..."

Write-Host "Checking pre-installed Ruby Version"

$rubyVersion = (ruby --version) | Out-String

if(!($rubyVersion -like 'ruby 2.5*'))
{
    $downloadUrl = "https://github.com/oneclick/rubyinstaller2/releases/download/rubyinstaller-2.5.1-1/rubyinstaller-devkit-2.5.1-1-x64.exe"

    Write-Host "Ruby not found and starting to download from $downloadUrl"

    $fileName = "$env:temp\"+$downloadUrl.Split('/')[-1]
    
    $client = New-Object System.Net.WebClient
    $client.DownloadFile($downloadUrl, $fileName)

    Write-Host "Ruby downloaded"

    Write-Host "Ruby installer starting silently"

    Invoke-Expression "$fileName /verysilent /log=ruby-install.log /dir=C:\\Ruby\\ /tasks=addtk,assocfiles,modpath"
} else {

    Write-Host "Ruby found -> $rubyVersion"

}

Invoke-Expression "gem install jekyll"

Invoke-Expression "gem install bundler"

Invoke-Expression "bundle install"
