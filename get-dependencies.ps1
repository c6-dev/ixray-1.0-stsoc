# Test and set path to 7-Zip
$globalPaths = $env:Path -split ';'
ForEach ($line in $globalPaths) {
    If (!(Test-Path ($line + "\7z.exe"))) {
        $path = Join-Path -Path ${env:ProgramFiles} `
                          -ChildPath "7-Zip\7z.exe"
    }
}

# Getting DirectX SDK June 2010 from archive
If (!(Test-Path "sdk\dxsdk_jun2010")) {
    Invoke-WebRequest -Uri "https://github.com/c6-dev/ixray-1.0-stsoc/releases/download/util/directxsdk-jun2010.zip" `
                      -OutFile "directxsdk-jun2010.zip"
    Start-Process -FilePath $path `
                  -ArgumentList "x directxsdk-jun2010.zip -osdk\dxsdk_jun2010" `
                  -NoNewWindow -Wait
    Remove-Item "directxsdk-jun2010.zip"
}
