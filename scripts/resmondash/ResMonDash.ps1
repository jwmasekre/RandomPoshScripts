<#
.NAME
    ResMonDash
.SYNOPSIS
    POC for an ASCII dashboard for CPU, RAM, and Disk usage (very slow)
.NOTES
    Updated: 2019-08-01        Verified functionality
    Release Date: 2019-08-01
   
  Author: Joshua Masek - self.joshuamasek.com / josh.masek@joshuamasek.com
#>

$totalmem = Get-WmiObject win32_operatingsystem | select-object totalvisiblememorysize

function write-usage {
    param ([string]$title,[int]$value)
    $paddedtitle = $title.padright(35)
    $valuetopad = [string]$value
    $paddedvalue = $valuetopad.padleft(4)
    write-host "|---|---|---|---|---||---|---|---|---|---|"
    write-host "|$paddedtitle$paddedvalue`%|"
    $counter = 0
    write-host "|" -nonewline
    While ($counter -lt $value) {
        if ($counter -lt 50) {write-host "#" -foregroundcolor Green -NoNewline}
        if ($counter -lt 75 -and $counter -ge 50) {write-host "#" -foregroundcolor Yellow -NoNewline}
        if ($counter -lt 100 -and $counter -ge 75) {write-host "#" -ForegroundColor Red -NoNewline}
        if ($counter -ge 100) {write-host "@@@@" -ForegroundColor Magenta -NoNewline}
        $counter +=2.5
    }
    write-host ""
}
while (1 -eq 1) {
    $cpuloadobj = get-counter "\processor(_total)\% processor time"
    $cpuloadval = $cpuloadobj.countersamples.cookedvalue[0]
    $cpuproc = (get-counter "\Process(*)\% Processor Time" -ErrorAction SilentlyContinue).countersamples | Select-object instancename,cookedvalue | where-object {$_.instancename -ne "idle" -and $_.instancename -ne "_total"} | sort-object cookedvalue -Descending | select-object -first 5
    $freemem = get-wmiobject win32_operatingsystem | select-object freephysicalmemory
    $memloadval = [math]::round(($totalmem.totalvisiblememorysize - $freemem.freephysicalmemory)/$totalmem.totalvisiblememorysize*100)
    $memproc = Get-Process | select-object processname,PagedMemorySize64 | Sort-Object PagedMemorySize64 -Descending | Select-Object -first 5
    $disktotalobj = get-counter -counter "\physicaldisk(_total)\% idle time"
    $disktotalval = 100 - $disktotalobj.countersamples.cookedvalue[0]
    $diskproc = (get-counter "\process(*)\io data bytes/sec" -ErrorAction SilentlyContinue).countersamples | select-object instancename,cookedvalue | where-object {$_.instancename -ne "idle" -and $_.instancename -ne "_total"} | sort-object cookedvalue -Descending | Select-Object -first 5
    clear-host
    write-usage -title "CPU Usage" -value $cpuloadval
    foreach ($entry in $cpuproc) {
        $process = ($entry.instancename).padright(35)
        $cpuvalue = [math]::round(($entry.cookedvalue),1)
        $cpupercent = ("$cpuvalue%").PadLeft(5)
        write-host "|$process$cpupercent|"
    }
    write-usage -title "Mem Usage" -value $memloadval
    foreach ($entry in $memproc) {
        $process = ($entry.processname).padright(32)
        $memsizemb = [math]::round(($entry.pagedmemorysize64 / 1024 / 1024),1)
        $memsize = ("$memsizemb MB").PadLeft(8)
        write-host "|$process$memsize|"
    }
    write-usage -title "Disk Usage" -value $disktotalval
    foreach ($entry in $diskproc) {
        $process = ($entry.instancename).padright(32)
        $usagesizemb = [math]::round(($entry.cookedvalue / 1024 / 1024),1)
        $usagesize = ("$usagesizemb MB").PadLeft(8)
        write-host "|$process$usagesize|"
    }
    write-host "|---|---|---|---|---||---|---|---|---|---|"
}