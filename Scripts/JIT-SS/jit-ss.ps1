<#
.NAME
    JIT-SS
.SYNOPSIS
    recreates mimpam without requiring anything other than rsat, best paired with a script that alerts on group membership changes
.NOTES
    Updated: 2019-10-16         introduced integration with a cred file generator
    Updated: 2019-10-16         now retrieves group list from a config file
    Updated: 2019-10-16         now retrieves variables from a config file
    Release Date: 2019-10-02

  Author: Joshua Masek - josh.masek@joshuamasek.com
#>

#pulls variables from config file
get-content "$psscriptroot\settings.conf" -ErrorAction inquire | ForEach-Object {
    $int  =""
    $var = $_ -split "=", 2
    $varname = $var[0]
    if ([int]::TryParse($var[1],[ref]$int) -eq $true) {
        $varvalue = $int
    }
    else {
        $varvalue = $var[1]
    }
    set-variable -name "$varname" -Value "$varvalue"
}

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

#choose group using group.conf file
function get-group {
    $grouplist = get-content "$psscriptroot\group.conf" -ErrorAction inquire
    $i = 0
    Write-Host "Please select which administrative group you'd like to temporarily belong to." -ForegroundColor darkcyan
    foreach ($line in $grouplist) {
        Write-Host "  $i)  $line" -ForegroundColor DarkGreen
        $i++
    }
    $groupselect = read-host
    if ((!($groupselect -match "^\d+$")) -or ($groupselect -gt $grouplist.length) -or ($groupselect -lt 0)) {
        write-host "Invalid selection" -ForegroundColor red
        get-group
    }
    else {
        $script:group = $grouplist[$groupselect]
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
    $servicecreds = import-clixml -Path $servicecredslocation
    Add-ADGroupMember -Identity $group -Members $adminaccount -Credential $servicecreds -MemberTimeToLive $timespan
}

#email on elevation
function send-auditemail {
    Send-MailMessage -Port 25 -To "$auditaccount@$emaildomain" -From "$ENV:Username@$emaildomain" -Subject "$auditsubject" -Body "$ENV:Username requested elevation to $group for `
    $($splittimeline[0]) hours and $($splittimeline[1]) minutes, starting at $currenttime and ending at $endtime."
    exit
}

get-splash