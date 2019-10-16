<#
.NAME
    get-serviceaccountcreds.ps1
.SYNOPSIS
    acquires service account credentials for storage in a file for later use in jit-ss.ps1
.NOTES
    Updated: 2019-10-16         completion
    Release Date: 2019-10-16

  Author: Joshua Masek - josh.masek@joshuamasek.com
#>

Write-Host "Welcome to the service account credential file creation tool." -ForegroundColor yellow
write-host "The purpose of this script is to make it easy for the IT team" -ForegroundColor yellow
write-host "  to establish the Just in Time - Self Service script without" -ForegroundColor yellow
write-host "  exposing service account credentials to all members of IT." -foreground yellow
write-host "Please have your service account manager input the credentials for the account:" -ForegroundColor Cyan
get-credential | export-clixml -path "$psscriptroot\serviceacctcreds.xml"
write-host "Your credentials are now stored at $psscriptroot\serviceacctcreds.xml" -ForegroundColor Green
write-host "NOTE: only $env:USERNAME will be able to use this file, and only on $env:COMPUTERNAME." -ForegroundColor Magenta
Pause 