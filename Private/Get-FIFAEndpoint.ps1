function Get-FIFAEndpoint {

    # used for simplified reading of API endpoints

    param (
        [string]$EndPoint
    )

    Invoke-WebRequest -Uri "http://worldcup.sfg.io/$EndPoint" | Select-Object -Expand Content | ConvertFrom-Json
}