<# This form was designed using POSHGUI.com, a free online gui designer for PowerShell
.NAME
    admingui
.SYNOPSIS
    used to launch as smartcard (admin) to further launch applications as admin
.NOTES
    Updated: 2019-07-26        Sanatized for github
    Release Date: 2019-01-23
   
  Author: Joshua Masek - self.joshuamasek.com / josh.masek@joshuamasek.com
#>

#function
function run-cmd {
    start-process cmd -verb runas
    }
function run-aduc {
    start-process dsa -verb runas
    }
function run-sccm {
#need to find a better way than hard-coding locations. maybe look for the shortcut in start menu and see where it points?
    if (test-path "C:\Program Files (x86)\Microsoft Configuration Manager\AdminConsole\bin\") {
        start-process "C:\Program Files (x86)\Microsoft Configuration Manager\AdminConsole\bin\Microsoft.ConfigurationManagement.exe" -verb runas
        }
    elseif (test-path "C:\Program Files (x86)\SCCM\AdminConsole\bin\") {
        start-process "C:\Program Files (x86)\SCCM\AdminConsole\bin\Microsoft.ConfigurationManagement.exe" -verb runas
        }
    else {
        $buttontype = [system.windows.messageboxbutton]::OK
        $messageboxtitle = "SCCM Not Found"
        $Messageboxbody = "SCCM was not found on your system. Please verify it is installed before using this button."
        $MessageIcon = [System.Windows.MessageBoxImage]::Error
        [System.Windows.MessageBox]::Show($Messageboxbody,$MessageboxTitle,$ButtonType,$messageicon)
        }
    }
function run-posh {
    start-process powershell -verb runas
    }
function run-cacbullet {
    #This is an in-house app, but I'm leaving this in place for repurposing. In future releases I may convert this to something else, like services.msc
    #invoke-item -path "REDACTED"
    }
function run-printmgmt {
    start-process printmanagement -verb runas
    }
function run-dns {
    start-process dnsmgmt -verb runas
    }
function run-gpmc {
    start-process gpmc -verb runas
    }
function run-dhcp {
    start-process dhcpmgmt -verb runas
    }
function run-perfmon {
    start-process perfmon -verb runas
    }
function run-explorerasadmin {
    start-process notepad -verb runas
    }
function run-devices {
    start-process devmgmt -verb runas
    }
function run-events {
    start-process eventvwr -verb runas
    }
function run-resmon {
    start-process resmon -verb runas
    }
function run-mmc {
    start-process mmc -verb runas
    }
function run-tasks {
    start-process taskmgr -verb runas
    }
function run-printadder {
    start-process $env:userprofile\randomposhscripts\scripts\print-adder\print-adder.bat -verb runas
    }
function run-secren {
    start-process $env:userprofile\randomposhscripts\sec-ren\sec-ren.bat -verb runas
    }

#form

#drawing the form
Add-Type -AssemblyName system.Windows.Forms, System.drawing
[Windows.Forms.Application]::EnableVisualStyles()

#window
$AdminConsole = New-Object Windows.Forms.Form
$AdminConsole.Opacity            = '.90'
$AdminConsole.Size               = '846,502'
$AdminConsole.text               = "CIO Admin Launcher"
$AdminConsole.BackColor          = "#4a4a4a"
$AdminConsole.TopMost            = $false
$AdminConsole.icon               = "$env:userprofile\randomposhscripts\scripts\admingui\adminguiico2-1.ico"
$AdminConsoleImage               = [system.drawing.image]::FromFile("$env:userprofile\randomposhscripts\scripts\admingui\adminguibg1.png")
$AdminConsole.BackgroundImage    = $AdminConsoleImage

#instructions label
$instructions                    = New-Object system.Windows.Forms.Label
$instructions.BackColor          = "transparent"
$instructions.text               = "press a button to launch as administrator - last updated 20190726"
$instructions.AutoSize           = $true
$instructions.width              = 25
$instructions.height             = 10
$instructions.location           = New-Object System.Drawing.Point(20,16)
$instructions.Font               = 'Georgia,13'
$instructions.ForeColor          = "#ffffff"
$instructions.Parent = $AdminConsole

#cmd button
$cmd                             = New-Object Windows.Forms.Button
$cmd.BackColor                   = "#000000"
$cmd.text                        = "cmd"
$cmd.width                       = 120
$cmd.height                      = 120
$cmd.location                    = New-Object System.Drawing.Point(16,56)
$cmd.Font                        = 'Georgia,10'
$cmd.ForeColor                   = "#ffffff"
$cmd.Parent = $AdminConsole

#powershell button
$posh                            = New-Object Windows.Forms.Button
$posh.BackColor                  = "#000000"
$posh.text                       = "powershell"
$posh.width                      = 120
$posh.height                     = 120
$posh.location                   = New-Object System.Drawing.Point(152,56)
$posh.Font                       = 'Georgia,10'
$posh.ForeColor                  = "#ffffff"
$posh.Parent = $AdminConsole

#active directory users and computers button
$dsa                             = New-Object Windows.Forms.Button
$dsa.BackColor                   = "#000000"
$dsa.text                        = "active directory"
$dsa.width                       = 120
$dsa.height                      = 120
$dsa.location                    = New-Object System.Drawing.Point(16,192)
$dsa.Font                        = 'Georgia,10'
$dsa.ForeColor                   = "#ffffff"
$dsa.Parent = $AdminConsole

#sccm button
$sccm                            = New-Object Windows.Forms.Button
$sccm.BackColor                  = "#000000"
$sccm.text                       = "sccm"
$sccm.width                      = 120
$sccm.height                     = 120
$sccm.location                   = New-Object System.Drawing.Point(16,328)
$sccm.Font                       = 'Georgia,10'
$sccm.ForeColor                  = "#ffffff"
$sccm.Parent = $AdminConsole

#dhcp button
$dhcp                            = New-Object Windows.Forms.Button
$dhcp.BackColor                  = "#000000"
$dhcp.text                       = "dhcp"
$dhcp.width                      = 120
$dhcp.height                     = 120
$dhcp.location                   = New-Object System.Drawing.Point(288,328)
$dhcp.Font                       = 'Georgia,10'
$dhcp.ForeColor                  = "#ffffff"
$dhcp.Parent = $AdminConsole

#group policy button
$gpmc                            = New-Object Windows.Forms.Button
$gpmc.BackColor                  = "#000000"
$gpmc.text                       = "group policy"
$gpmc.width                      = 120
$gpmc.height                     = 120
$gpmc.location                   = New-Object System.Drawing.Point(288,192)
$gpmc.Font                       = 'Georgia,10'
$gpmc.ForeColor                  = "#ffffff"
$gpmc.Parent = $AdminConsole

#dns button
$dns                             = New-Object Windows.Forms.Button
$dns.BackColor                   = "#000000"
$dns.text                        = "dns"
$dns.width                       = 120
$dns.height                      = 120
$dns.location                    = New-Object System.Drawing.Point(288,56)
$dns.Font                        = 'Georgia,10'
$dns.ForeColor                   = "#ffffff"
$dns.Parent = $AdminConsole

#print server button
$printserver                     = New-Object Windows.Forms.Button
$printserver.BackColor           = "#000000"
$printserver.text                = "print server"
$printserver.width               = 120
$printserver.height              = 120
$printserver.location            = New-Object System.Drawing.Point(152,328)
$printserver.Font                = 'Georgia,10'
$printserver.ForeColor           = "#ffffff"
$printserver.Parent = $AdminConsole

#cacbullet button
$cacbullet                       = New-Object Windows.Forms.Button
$cacbullet.BackColor             = "#000000"
$cacbullet.text                  = "cacbullet"
$cacbullet.width                 = 120
$cacbullet.height                = 120
$cacbullet.location              = New-Object System.Drawing.Point(152,192)
$cacbullet.Font                  = 'Georgia,10'
$cacbullet.ForeColor             = "#ffffff"
$cacbullet.Parent = $AdminConsole

#perfmon button
$perfmon                         = New-Object Windows.Forms.Button
$perfmon.BackColor               = "#000000"
$perfmon.text                    = "performance monitor"
$perfmon.width                   = 120
$perfmon.height                  = 120
$perfmon.location                = New-Object System.Drawing.Point(560,192)
$perfmon.Font                    = 'Georgia,10'
$perfmon.ForeColor               = "#ffffff"
$perfmon.Parent = $AdminConsole

#notepad/explorer-as-admin button
$explore                         = New-Object Windows.Forms.Button
$explore.BackColor               = "#000000"
$explore.text                    = "notepad (admin in explorer)"
$explore.width                   = 120
$explore.height                  = 120
$explore.location                = New-Object System.Drawing.Point(420,56)
$explore.Font                    = 'Georgia,10'
$explore.ForeColor               = "#ffffff"
$explore.Parent = $AdminConsole

#device manager button
$devices                         = New-Object Windows.Forms.Button
$devices.BackColor               = "#000000"
$devices.text                    = "device manager"
$devices.width                   = 120
$devices.height                  = 120
$devices.location                = New-Object System.Drawing.Point(420,192)
$devices.Font                    = 'Georgia,10'
$devices.ForeColor               = "#ffffff"
$devices.Parent = $AdminConsole

#event viewer button
$events                          = New-Object Windows.Forms.Button
$events.BackColor                = "#000000"
$events.text                     = "event viewer"
$events.width                    = 120
$events.height                   = 120
$events.location                 = New-Object System.Drawing.Point(560,328)
$events.Font                     = 'Georgia,10'
$events.ForeColor                = "#ffffff"
$events.Parent = $AdminConsole

#resmon button
$resmon                          = New-Object Windows.Forms.Button
$resmon.BackColor                = "#000000"
$resmon.text                     = "resource monitor"
$resmon.width                    = 120
$resmon.height                   = 120
$resmon.location                 = New-Object System.Drawing.Point(560,56)
$resmon.Font                     = 'Georgia,10'
$resmon.ForeColor                = "#ffffff"
$resmon.Parent = $AdminConsole

#mmc button
$mmc                             = New-Object Windows.Forms.Button
$mmc.BackColor                   = "#000000"
$mmc.text                        = "mmc"
$mmc.width                       = 120
$mmc.height                      = 120
$mmc.location                    = New-Object System.Drawing.Point(696,56)
$mmc.Font                        = 'Georgia,10'
$mmc.ForeColor                   = "#ffffff"
$mmc.Parent = $AdminConsole

#task manager button
$tasks                           = New-Object Windows.Forms.Button
$tasks.BackColor                 = "#000000"
$tasks.text                      = "task manager"
$tasks.width                     = 120
$tasks.height                    = 120
$tasks.location                  = New-Object System.Drawing.Point(420,328)
$tasks.Font                      = 'Georgia,10'
$tasks.ForeColor                 = "#ffffff"
$tasks.Parent = $AdminConsole

#print adder button
$printadder                      = New-Object Windows.Forms.Button
$printadder.BackColor            = "#000000"
$printadder.text                 = "print adder"
$printadder.width                = 120
$printadder.height               = 120
$printadder.location             = New-Object System.Drawing.Point(696,192)
$printadder.Font                 = 'Georgia,10'
$printadder.ForeColor            = "#ffffff"
$printadder.Parent = $AdminConsole

#sec-ren button
$secren                          = New-Object Windows.Forms.Button
$secren.BackColor                = "#000000"
$secren.text                     = "sec-ren"
$secren.width                    = 120
$secren.height                   = 120
$secren.location                 = New-Object System.Drawing.Point(696,328)
$secren.Font                     = 'Georgia,10'
$secren.ForeColor                = "#ffffff"
$secren.Parent = $AdminConsole


$AdminConsole.controls.AddRange(@($instructions,$cmd,$posh,$dsa,$sccm,$devices,$dhcp,$perfmon,$explore,$gpmc,$dns,$printserver,$cacbullet,$events,$resmon,$mmc,$tasks,$printadder,$secren))

$cmd.Add_Click({ run-cmd })
$dsa.Add_Click({ run-aduc })
$sccm.Add_Click({ run-sccm })
$posh.Add_Click({ run-posh })
$cacbullet.Add_Click({ run-cacbullet })
$printserver.Add_Click({ run-printmgmt })
$dns.Add_Click({ run-dns })
$gpmc.Add_Click({ run-gpmc })
$dhcp.Add_Click({ run-dhcp })
$perfmon.Add_Click({ run-perfmon })
$explore.Add_Click({ run-explorerasadmin })
$devices.Add_Click({ run-devices })
$events.Add_Click({ run-events })
$resmon.Add_Click({ run-resmon })
$mmc.Add_Click({ run-mmc })
$tasks.Add_Click({ run-tasks })
$printadder.Add_Click({ run-printadder })
$secren.Add_Click({ run-secren })

[void]$AdminConsole.ShowDialog()