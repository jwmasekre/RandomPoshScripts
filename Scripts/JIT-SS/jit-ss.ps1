<#
.NAME
    JIT-SS
.SYNOPSIS
    recreates mimpam without requiring anything other than rsat, best paired with a script that alerts on group membership changes
.NOTES
    Updated: 2019-10-02        work begins
    Release Date: 2019-10-02

  Author: SGT Joshua Masek - joshua.w.masek.mil@mail.mil
#>

#globalvariables
$searchbase = "samplesearchbase"
$adminidentifier = ".a"
$minmin = 0
$maxmin = 59
$minhour = 0
$maxhour = 2
$servicecredslocation = .\serviceacctcreds.txt
$emaildomain = "joshuamasek.com"
$auditaccount = "account.auditing"
$auditsubject = "ELEVATION ALERT: SCRIPT"

#splash
function get-splash {
    [console]::windowwidth=100
    [console]::windowheight=40
    [console]::bufferwidth=[console]::windowwidth
    [console]::ForegroundColor='Black'
    [console]::BackgroundColor='White'
    [console]::Title='Just In Time - Self Service'
    clear-host
    Write-Host "                                                                /&@@#                *&@@#         "
    Write-Host "      @@@@@@@    @@@@@@@   @@@@@@@@@@@@@@@@@@                @@@@@@@@@@@          @@@@@@@@@@@,     "
    Write-Host "      @@@@@@@    @@@@@@@   @@@@@@@@@@@@@@@@@@              @@@@@@@@@@@@@@@      @@@@@@@@@@@@@@@    "
    Write-Host "      @@@@@@@    @@@@@@@   @@@@@@@@@@@@@@@@@@             @@@@@@@  .@@@@@@@    @@@@@@@   @@@@@@@   "
    Write-Host "      @@@@@@@    @@@@@@@        ,@@@@@@#                 /@@@@@@     @@@@@@   .@@@@@@     @@@@@@   "
    Write-Host "      @@@@@@@    @@@@@@@        ,@@@@@@#                 &@@@@@@     @@@@@@   (@@@@@@     @@@@@@   "
    Write-Host "      @@@@@@@    @@@@@@@        ,@@@@@@#                 *@@@@@@@             .@@@@@@@             "
    Write-Host "      @@@@@@@    @@@@@@@        ,@@@@@@#                  @@@@@@@@@            @@@@@@@@@           "
    Write-Host "      @@@@@@@    @@@@@@@        ,@@@@@@#                   @@@@@@@@@@           @@@@@@@@@@         "
    Write-Host "      @@@@@@@    @@@@@@@        ,@@@@@@#                    @@@@@@@@@@@,         #@@@@@@@@@@(      "
    Write-Host "      @@@@@@@    @@@@@@@        ,@@@@@@#                      @@@@@@@@@@@          @@@@@@@@@@@     "
    Write-Host "      @@@@@@@    @@@@@@@        ,@@@@@@#    %@@@@@@@@@          &@@@@@@@@@.          #@@@@@@@@@*   "
    Write-Host "      @@@@@@@    @@@@@@@        ,@@@@@@#    %@@@@@@@@@            #@@@@@@@@            *@@@@@@@@   "
    Write-Host "      @@@@@@@    @@@@@@@        ,@@@@@@#    %@@@@@@@@@              @@@@@@@#             @@@@@@@@  "
    Write-Host "      @@@@@@@    @@@@@@@        ,@@@@@@#                 @@@@@@.     @@@@@@@  @@@@@@/     @@@@@@@  "
    Write-Host "     .@@@@@@@    @@@@@@@        ,@@@@@@#                 @@@@@@&     @@@@@@*  @@@@@@@     @@@@@@%  "
    Write-Host " @@@@@@@@@@@@    @@@@@@@        ,@@@@@@#                  @@@@@@@, &@@@@@@@    @@@@@@@* #@@@@@@@   "
    Write-Host " @@@@@@@@@@@     @@@@@@@        ,@@@@@@#                  ,@@@@@@@@@@@@@@@      @@@@@@@@@@@@@@@    "
    Write-Host " @@@@@@@@@@      @@@@@@@        ,@@@@@@#                    @@@@@@@@@@@@         @@@@@@@@@@@@      "
    Write-Host "   ./#/.                                                        .**.                 .**.          "
    get-group
}

#choose group - playing with the idea of a config that you can edit to pull these from, or automatically generate from AD
function get-group {
    Write-Host "Please select which administrative group you'd like to temporarily belong to." -ForegroundColor darkcyan
    Write-Host "  1)  Domain Administrators" -ForegroundColor darkgreen
    Write-Host "  2)  Enterprise Administrators" -ForegroundColor darkgreen
    Write-Host "  3)  SCCM Administrators" -ForegroundColor darkgreen
    Write-Host "  4)  DNS Administrators" -ForegroundColor darkgreen
    $groupselect = read-host
    switch ($groupselect) {
        1 {$script:group = "Domain Administrators";break}
        2 {$script:group = "Enterprise Administrators";break}
        3 {$script:group = "SCCM Administrators";break}
        4 {$script:group = "DNS Administrators";break}
        default {write-host "Invalid selection" -ForegroundColor red;get-group;break}
    }
    get-membership
}

#check if allowed
function get-membership {
    $adminaccount = $env:username + $adminidentifier
    $actualaccount = Get-ADUser -searchbase $searchbase -Filter * -Properties * | where-object {$_.samaccountname -eq $adminaccount} -ErrorAction SilentlyContinue
    if (!($adminaccount -eq $actualaccount.samaccountname)) {
        Write-Host "You do not have an admin account. Unable to grant you any administrative permissions." -ForegroundColor darkmagenta
        exit
    }
    elseif (!($actualaccount.memberof -like "*$group-allowed*")) {
        Write-Host "Your admin account is not allowed to be elevated to $group." -ForegroundColor DarkMagenta
        exit
    }
    else {
        write-host "$adminaccount is allowed to be a member of $group temporarily." -ForegroundColor darkgreen
        get-timeframe
    }
}

#timeframe
function get-timeframe {
    Write-Host "For how long would you like to request $group membership? Use the format " -ForegroundColor DarkCyan -NoNewline
    write-host "h:mm" -foregroundcolor cyan -backgroundcolor Black -NoNewline
    write-host ". Maximum of $maxhour`:$maxmin." -ForegroundColor DarkCyan
    $timeline = read-host
    $splittimeline = $timeline -split ":"
    if (!($timeline -match "\d:\d\d")) {
        write-host "Incorrect format." -ForegroundColor Red
        get-timeframe
    }
    elseif (!(($splittimeline[0] -le $maxhour) -and ($splittimeline[1] -le $maxmin) -and ($splittimeline[0] -ge $minhour) -and ($splittimeline[1] -ge $minmin))) {
        write-host "Time provided is outside the maximum or minimum time allowed." -ForegroundColor Red
        get-timeframe
    }
    else {
        $currenttime = get-date
        $timespan = New-TimeSpan -Hours $splittimeline[0] -Minutes $splittimeline[1]
        $script:endtime = $currenttime + $timespan
        write-host "The time is currently $currenttime. $adminaccount will be a member of $group for $($splittimeline[0]) hours and $($splittimeline[1]) minutes." -ForegroundColor DarkGreen
        add-tempmember
    }
}

#elevate
function add-tempmember {
    write-host "Adding $adminaccount to $group until $endtime."
    $servicecreds = Get-Content -Path $servicecredslocation
    Add-ADGroupMember -Identity $group -Members $adminaccount -Credential $servicecreds -MemberTimeToLive $timespan
}

#email on elevation
function send-auditemail {
    Send-MailMessage -Port 25 -To "$auditaccount@$emaildomain" -From "$ENV:Username@$emaildomain" -Subject "$auditsubject" -Body "$ENV:Username requested elevation to $group for `
    $($splittimeline[0]) hours and $($splittimeline[1]) minutes, starting at $currenttime and ending at $endtime."
    exit
}

get-splash