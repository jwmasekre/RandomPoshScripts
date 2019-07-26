the admin gui launcher is used to launch administrative tools as administrator. its intent is to aggregate commands to launch these tools behind a gui.

installation instructions:
copy the adminguilauncher.bat shortcut file to your desktop

usage instructions:
double-click the shortcut
this shortcut will launch the admin gui launcher as /smartcard, so you then must pick your admin card and enter your pin
in the Open File - Security Warning dialog box, select Open
in cmd window that opens, press "r" and hit enter

common errors:
'i enter in my pin, and the box just closes'
--verify you're using the right card and entering in your pin correctly. if this still happens, contact SPC Masek
'i got a pop-up when trying to run sccm'
--verify sccm is installed
'when i click on a button, it just puts a bunch of red text in the cmd window'
--you're probably running as a regular user, make sure to use your admin card
'when i close the cmd window, it closes out of the launcher'
--don't do that