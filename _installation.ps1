Write-Host "Starting Installation Steps"

Write-Host "..."

Write-Host "Checking pre-installed Ruby Version"

$rubyVersion = (ruby --version) | Out-String

if(!($rubyVersion -like 'ruby 2.6*')) {

    $downloadUrl = "https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-2.6.0-1/rubyinstaller-devkit-2.6.0-1-x64.exe"

    Write-Host "Ruby not found and starting to download from $downloadUrl"

    $fileName = "$env:temp\"+$downloadUrl.Split('/')[-1]

    $client = New-Object System.Net.WebClient
    $client.DownloadFile($downloadUrl, $fileName)

    Write-Host "Ruby downloaded"

    Write-Host "Ruby installer starting silently"

    Invoke-Expression "$fileName /verysilent /log=$env:temp\ruby-install.log /dir=C:\\Ruby\\ /tasks=addtk,assocfiles,modpath"

    cd C:\\Ruby\\bin

    Invoke-Expression "./ridk.cmd install 3"

} else {

    Write-Host "Ruby found -> $rubyVersion"

}

Invoke-Expression "gem install jekyll"

Invoke-Expression "gem install bundler"

Invoke-Expression "bundle install"
