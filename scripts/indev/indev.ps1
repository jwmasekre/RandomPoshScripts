﻿Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")] 
public static extern IntPtr GetConsoleWindow();
[DllImport("user32.dll")]
public static extern bool MoveWindow(IntPtr hWnd, int X, int Y, int W, int H); '

$consoleHWND = [Console.Window]::GetConsoleWindow();
$consoleHWND
[Console.Window]::MoveWindow($consoleHWND,-7,0,1920,1080);
Write-Host "                                                                                                                                  :oooooo//oso++/-``                                                                                                           " -ForegroundColor Cyan
Write-Host "             .      :``        +s                                                 y+              ````                        ``    +dMMMMMMMMMMMMMMMMNNds-                                                                                                       " -ForegroundColor Cyan
Write-Host "   :yo-     /N-..   N-``..    .::      ....            ``....     ....   . ..``    ./-    ``-.:-    .do..                         .dMMMMMMMMMMMMMMMMMMMMMMMh/          +N+                                                                                        " -ForegroundColor Cyan
Write-Host "    ``-ohs`` .sM++:   Nhs+yo   :oN     hho+o/           dho+o:  -ys++/  -Nys+h/  ``+hy    /Ns/oh.  :my++``                       /NMMMMMMMMMMMMMMMMMMMMMMMMMMh``        +MMo                                                                                       " -ForegroundColor Cyan
Write-Host "    .+yy/   -N      N:  +d    .M``    .+sso.           -+sso.  ys      -N.  ````    oh    /m   h+   h+                    -   .sMMMMMMMMMMMMMMMMMMMMMMMMMMMMMd``       /dMM+                                                                                      " -ForegroundColor Cyan
Write-Host "   :o:``     .m++h-  N-  :d   :oM+-   o+++d+           o+++d/  -hs///  -N       ``/hd/.  /Ms:oh-   sy/os                -d  :/MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM:        ``NMN-                                                                                     " -ForegroundColor Cyan
Write-Host "             ``--.   .   ``.   .---.   ``---.            .---.    ``.---   .        ----``  /m-:-``    ``.-.``                +h   +MMMMMMMMMMMMMMMMMMMNNNmNNMMMMMM:         /NMo                                                                                     " -ForegroundColor Cyan
Write-Host "                                                                                       ./                             oh   ``MMNhso++ohmMMMMNs:....````.-sdMMMh          yMo                                                                                     " -ForegroundColor Cyan
Write-Host "     :.                       -:                                                                                      hd   -MMd++so``  ``:hmNo/:-/::/ooo+:oMMM:         sd+                                                                                     " -ForegroundColor Cyan
Write-Host "     o:                       /o                                                                                      dN````hNMMMMms.   -ddhhmd``   - ``-odhmMMNo         ./:                                                                                     " -ForegroundColor Cyan
Write-Host "   ``oyo    ``ysoos.           +sh     h+sos-                                                                           dh:yMMMMNs++    yMh:.sN-     .oyo-/sNso         .o+                                                                                     " -ForegroundColor Cyan
Write-Host "    ``sy    ``sys/:``            -M``   ``N/.``sy                                                                         .``hy/+NMMMMNMy-/sdMMMMddMN/    sMMNNNNMMM- ``--/-  ``hN``                                                                                    " -ForegroundColor Cyan
Write-Host "    .sh.   ``--:+m.           ``:M.``  ``N.  +h                                                                          ``hMy sMMMMMMMNMMMMMMMMNsNNs``  sMMMMMMMMM+:dNNho:  :m-                                                                                    " -ForegroundColor Cyan
Write-Host "   ``+oo+.  ``++++/            /os+:   o``  -+                                                                           NMs +MMMMMMMMMMMMMMMMMmdmhs  oMMMMMMMMMmNysNN:-  -m/                                                                                    " -ForegroundColor Cyan
Write-Host "                                                                                                                      sMs /MMMMMMMMMMMmhMNNhhMo-:shNMMMMMMMMMMM+ .mos  .ms                                                                                    " -ForegroundColor Cyan
Write-Host "                                                                                                                    .yhNs oMmMMMMMMMMMmsy--  ymNNMMMMMMMMMMMMMso-/Ny``  /my                                                                                    " -ForegroundColor Cyan
Write-Host "       .y                            .oh:                                               ``+                          :N-:- -MmMMMMMMMMMMmsoyhs++shMMMMMMMMMMMNMhNNNy``   :mh:                                                                                   " -ForegroundColor Cyan
Write-Host "   ``/+++N   -+++:   +``  .+   :+++-     d+    ``:+++-  ``s/oo:   /++/+/   -+++:``  /:/++-  ``oM++:                       //``dm: oNMMMMMMMMdso//oosydhoMMMMMMMMMMM:+dds-     ``+ys                                                                                   " -ForegroundColor Cyan
Write-Host "   ho.-sN  :m/:/m:  ho  sy  /m/:/m-    h+    oh-.:N. .M+.-yo  msom:N`` .N/::d+  dh/.+d  ``/M...                         .MMm. -sMMMMMm++yhhhhhhyos+oMMMMMMMMMM-           .ys.                                                                                  " -ForegroundColor Cyan
Write-Host "   d/ ``/N  /Nooos-  ``d/+d``  +mooos.    do    sy  ``N. .M- ``ss  m//d``N. -Msoos:  d/  -N   -M  .``                        /MMMh  ``NMMMMMNMMy::/sMMMMMNMMMMMMMMMy             ./-                                                                                  " -ForegroundColor Cyan
Write-Host "   :ssssh  ``ossss.   .hh.   .sssss.  .shyo``  .ssss+  .Myoso.  y-:s h. ``ossss-  s:  .h   ``sssy.                        hMMmM-  oMMMMMMMMNdhhNMMMMMMMMMMMMMMm-:           ``:/o``                                                                                 " -ForegroundColor Cyan
Write-Host "                                                     .m``````                                                           -MMMNm``   sNMMMMMMMMMMMMMMMMMMMMMMMMd:y.           ``-:+.                                                                                 " -ForegroundColor Cyan
Write-Host "                                                      .                                                              :MMNd-     -ymMMMMMMMNMMNmNNNmmmhNMmdmh              /y+                                                                                 " -ForegroundColor Cyan
Write-Host "                                                                                                                     dMo:         .dMMNy+/:s+.``.--..-sNMMMMo               :+``                                                                                " -ForegroundColor Cyan
Write-Host "                                                                                                                    ``mM/        ``  /MMNs+-   ``./:``-oMMMMMMy.               -/-                                                                                " -ForegroundColor Cyan
Write-Host "                                                                                                                    +sMNo      ``s. .MMMMMMy++hNMNmMMMMMMMM+                -ss.                                                                               " -ForegroundColor Cyan
Write-Host "                                                                                                                    ``dMMh       ``   hMMMMMMMMMMMMMMMMMMMMN:                 ``-:``                                                                              " -ForegroundColor Cyan
Write-Host "                                                                                                                     .oy+       .   /MMMMMMMMMMMMMMMMMMMN:                  ``.-``                                                                              " -ForegroundColor Cyan
Write-Host "                                                                                                                         ``           NMMMMMMMMMMMMMMMMMMM.                  :.o/                                                                              " -ForegroundColor Cyan
Write-Host "                                                                                                                   .sossyd+``         oMMMMMMMMMMMMMMMMMMMo``                  -s+                                                                              " -ForegroundColor Cyan
Write-Host "                                                                                                                    hdmNMMMNs`` ````    ``dMMMMMMMMMMMMMMMMMMMdy/                /yo/:``                                                                           " -ForegroundColor Cyan
Write-Host "                                                                                                                    ``:hso+//--smdhs.  .NMMMMMMMMMMMMMMMMMMNo``:s              ``so//.++++-                                                                      " -ForegroundColor Cyan
Write-Host "                                                                                                                    -yyyooo+oo++/:-    oMMMMMMMMMMMMMMMMd+``-hm.                /s:+MMMMMm+``                                                                   " -ForegroundColor Cyan
Write-Host "                                                                                                                        ``:/+.``/-.     /sMMMMMMMMMMMMMMNy/sNMm.              -/yMN/ -/yNMMMN+``                                                                 " -ForegroundColor Cyan
Write-Host "                                                                                                                         ``+/+Myy-    :d-MMMMMMMMMMMMMhoMydMd.           .      ``      ``:+yNMm/                                                                " -ForegroundColor Cyan
Write-Host "                                                                                                                     :+/.m/mMN+     .NsmMMMMMMMMMMMMNosysMh``            .y-               ``/mMs``                                                              " -ForegroundColor Cyan
Write-Host "                                                                                                                   :mMMsm.NMy``     .mMMMMMMmMMMMMMMMMMMMMh             -+.                   ``-                                                               " -ForegroundColor Cyan
Write-Host "                                                                                                                 ``ssom+hyyo.       hMmNMMMMNMMMMMMMMMMMMM.                                                                                                    " -ForegroundColor Cyan
Write-Host "                                                                                                               ``+mm::s.m``         /MMM/MMMMMMMMMMMMMMMMM/       ````                        -      ``                                                            " -ForegroundColor Cyan
Write-Host "                                                                                                             ``sNMM/ +Nh. -:      ``mMMo sMMMMMMMMMMMMMMm/        -                ``  -+``  -oh- :``                                                              " -ForegroundColor Cyan
Write-Host "                                                                                                            .mMNMM:-d-d  yy``     +MMM. .MMMMMMMMMMMMMN``                       .  ````  ``  :m.``.      .                                                          " -ForegroundColor Cyan
Write-Host "                                                                                                            dMhd:N :ymMh``        dMMM+::yMMMMMMMMMMMMN``                   .    hs        `` /msh                                                               " -ForegroundColor Cyan
Write-Host "                                                                                                         -``yMM.oNd  dMMM.       ``MMMMMMMMMMMMMMMMMMMMM:               .:/+     /.           .:o                                                               " -ForegroundColor Cyan
Write-Host "                                                                                                        .+oMMM/``mh  dMMd        -MMMMMMMMMMMMMMMMMMMMM/               ``/hy         ``                                                                          " -ForegroundColor Cyan
Write-Host "                                                                                                      ``ymhNNMMd +d  hMM+        +MMMMMMMMMMMMMMMMMMMMm``              +hy+``         s``   ``/``                                                                   " -ForegroundColor Cyan
Write-Host "                                                                                                     ``.NsMMosMN. oo ddM.  --    sMMMMMMMMMMMMMMMMMMMy``              -h+-              ``oh/                                        ````....``      ``::``           " -ForegroundColor Cyan
Write-Host "                                                                                                    :d``mmdNN:oh+ .s``h+h  ``N+    hMMMMMMMMMMMMMMMMMMN``               /.                .hNs.                               .ddy/hddhdmNNNmmdy``..-:.            " -ForegroundColor Cyan
Write-Host "                                           ``-.-::                      -mmmd-o- :ss+/.hyyy+.        oo``hy``sMN: o: : +o/  sm``    dMMMMMMMMMMMMMMMMMMo``                      `` `` ``-     /s:``   ..              ``/s          ``..:--oo/.....://sh/--``             " -ForegroundColor Cyan
Write-Host "                              ````      .``   :NNNNN.      ``````.-.``        ``MMNd/-::----``-+.-.``.``hs:``````.````+/  +My+`````` ``````h  ``N+``    :NdmMMMMs//dMMM:mMMd+``             ```` ````.`````` -+y-     ```````````` ``               ``:/            ```` --..``  `````` ````. ``        ``      " -ForegroundColor Cyan
Write-Host "                ``oyyso/:hdddddmms   ``dmmmddmMN-..     -ymmmmNNmy``       mh+MMNNNNNmmdddmmmmmdMMNmmmmmm/   /Mmmmmdmmmmh.:yMNmddddmMNNMMMMoymMMMMNMMMNmddddhyo:.   .dmmdmmNmmmo````     ommmmmmmddd:        :hmddmmdd-        ``dmmmmmmmmo.``````-mdddmmddy -+os      " -ForegroundColor Magenta
Write-Host "               ``dMNmdhsmMMMMMMMMo   /MMMMMMMMm  ./``  oNMMMMMMMMM/       hmmMMMMMMMMMMMMMMMMMMMMMMMMMMMm``/hNMMMMMMMMMMMmNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMm+  dMMMMMMMMMMN     ``sMMMMMMMMMMM: .     +NMMMMMMMMh``````     +MMMMMMMMMMNdmmNMMMMMMMMh -ooy      " -ForegroundColor Magenta
Write-Host "               -/-:smd:MMMMMMMMN``   mMMMMMMMN/      +MMMMMMMMMMMh     .sNMMMMMMMMMMMMMMMMMMMMMMMMMMMMNmmMMMMMMMMmdNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN.-MMMMMMMMMMMh``   ``yMMMMMMMMMMNh`` :-  .yMMMMMMMMMMMh/+oshyomMMMMMMMMMMmssyMMMMMMMMdyhdNMy      " -ForegroundColor Magenta
Write-Host "                  ``-::dMMMMMMMM/   +MMMMMMMm.     ``sMMMMMMMMMMMM/    :mMMMMMMMMMdddmMMMNdNMMMMMMMMMNyMMMMMMMMMNN-oMMMMMMMMNmdddNMMMMmdmNMMMMMMMMMmdddmNMMMMMMMN/sMMMMMMMMMMM/   :dMMMMMMMMMMM/``  .o /NMMMMMMMMMMMMh```` ``-sNMMMMMMMMMMMh- :MMMMMMMd``.--::-      " -ForegroundColor Magenta
Write-Host "                 .:/++MMMMMMMMm:/+yNMMMMMMMd.    -dMMMMMMMMMMMMMs.  /NMMMMMMMMMN+-omyyhoyNmMMMMMMMMmmMMMMMMMM+.-hMMMMMMMMNo+mdhNMMMMNdNMMMMMMMMMM/..-:dMMMMMMMMsNMMMMMMMMMMMs. oMMMMMMMMMMMMd-``   -oNMMMMMMMMMMMMN/ssysooNMMMMMMMMMMMMN.hMMMMMMM/             " -ForegroundColor Magenta
Write-Host "                 -/:-mMMMMMMMMMMMMMMMMMMMMMd``   :NMMMMMMmsMMMMMMMh .NMMMMMMMMm/Nd-/Mh/hNMNhMMMMMMMMMMMMMMMMmo`` sMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMmmmmNMMMMMMMMdsMMMMMMMMMMMMMm/NMMMMMMMMMMMMN.   .hMMMMMMMsNMMMMMMy`` ``.:NMMMMMMMMMMMMMMdMMMMMMMM+             " -ForegroundColor Magenta
Write-Host "                    -MMMMMMMMMMMMMMMMMMMMMM-  ``sNMMMMMMN//MMMMMMMM:hMMMMMMMMN:.::dNMds/yM+mMMMMMMMMMMMNNMm/``  -MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMd/NMMMMMMMMMMMMMMMMMMMMMMMMMMMMh   -mMMMMMMM+``dMMMMMMMo   /MMMMMMMMhMMMMMMMMMMMMMMM:             " -ForegroundColor Magenta
Write-Host "                    sN+o///+ossoooooooo+sNh  ``hNoooooodmdhho////mMMMMy+/+/yNo.``  -:shhdmmdMd/+oooso+/:-sMd``   sMysoooosssssssssssssmNNNh:ooooooooooooooymMMd+``yMsooo+hMyoo+/mMyo/+odMo+oo/yN/ .oNh/ooooohsyms/+o+/Nd   /Mo+o+/od.No++/+mm+/+/+Nh              " -ForegroundColor Magenta
Write-Host "                   ``od...``.y/:/ddmd``...``hs````:+m:......-::..----.sMshN-:--.m+          ````-MMs....+h/.----dd.``  /M.----:ddhohdhhmdmmmhhNNo--..:ssyhho.---sMMh--odm.::--NMh....ys---.oMm---.:N+``:mMd-......--::---...ho  ``/m.-...y/ +y..../:..````o/               " -ForegroundColor Magenta
Write-Host "                   hMMmmmmmy   .+MMmNNNmMd``hMMNmNNNNmmmmmmNMMMNNNMmNMMMMNmMNsoooooooooo/+MMNNNNNN/NNMMMNNMdo- dMmMMMMMMMhosysommMMMMMMMNMNNNNyd:/MMNMMNMMMNo.sMMNMMNNMMMNNNNNNNMMNMMMNMMNMMNhNMMMNNNNNNNNNNNNMMNNmNN+ +MMNNNmmN`` oMmmNNNNNNmdm``               " -ForegroundColor Magenta
Write-Host "                  .MMMMMMMm``    hMMMMMMMMydMMMMMMMd++dNNmNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNMMMMMMM+oNMMMMMMMMMm``+MMMMMMMMMMMMMMMMMMMMMMMMMMMMMy/+  sMMMMMMMMM+``NMMMMMMMyMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMo++oshmMMMMMMMMMd mMMMMMMMo  ``mMMMMMMMMMMN.               " -ForegroundColor Magenta
Write-Host "                  yMMMMMMM+    -MMMMMMMMMMMMMMMMMh.  ....:dMMMMMMMMMmMMMMMMMMMMMMMMMMMNNMMMMMMMm`` .dMMMMMMMMm. sMMMMMMMMMMMMMMMMMMsMMMMMMMMM:hy- ``mMMMMMMMMNyMMMMMMMd/MMMMMMMMMm/dMMMMMMMMMMMMMMMMMm``    ``.yMMMMMMMMM+MMMMMMMN``   /MMMMMMMMMMm``               " -ForegroundColor Magenta
Write-Host "                 .NNNNNNNm     hNNNNNNMMMMMNNNNNo:/+-/shddNMNNNMMMMm``smNMMNNNNNNNNNNNNsNMMNNNNN+++//MMNNNNNNNd. /hmNMMMNNNNNNNNNNd+MMNNNNNNyyhy/  +NNNNNNNNyoNNNNNNNNMMNNNNNNNd..MMNNNNNmoNNNNNNNNh.       ``NMMNMMMMMyMNNNNNN+     yNNNNNMMMs.                " -ForegroundColor Magenta
Write-Host "                 .+/+ooyy-     /:::oyhdMMMMysyhydMMMmmmmMMMMdhhmMd/.  ``-/+::::::::::::.++::/+syyMMMMMM+:::::::. ``./sdNo::::::/yy//NMNhhhhhhhMNMo  ``hmdyyyydhydhhyyyydmyy:::+/:--.s::::::/.:::::::.``         +s::+ddo/:/:::::-      ``-::::sdh.                 " -ForegroundColor Magenta
Write-Host "                 ``:::-..+.   ``+y``/yNNmdhdhso+/NMMMMN+.+mMMMMMMNMM+.``            ``....-::+ydds-osymdmMMms:     .sdNMN+-      --oN+.dMMMMMMMMMMMM+ .hMdydmmd+omMmdNMMMmy``   -dho.        .``                                                                     " -ForegroundColor Cyan
Write-Host "                             -oo:-//:  ..``````-/ymdhys+``.hMMMMh/-:oddm-``         ``/yNMysdNNMMmd++os: ./shs: ``  .mMMMMMMds:.```` odmMhhhMMMMMNMMMMys``+NNs//+dyssymh  .omM/      . .``      ``                                                                        " -ForegroundColor Cyan
Write-Host "                                                        //oo/      o-o        ``-  .:-.-.:Ms`` -+:``./.      /. yMMMMMMMMMMMmds/..dNNMMhhNMyMMMM- .Nm:../hmy``/-``     ``sN/           ``+o-``                                                                        " -ForegroundColor Cyan
Write-Host "                                                                                        hM   s``..omy+y.  ````  NMMMMMMMMMMMMMMMMmdmsos````+MMMNds`` sh:``Ns+o+y.-/````      +y             ``:+-       ``-``                                                             " -ForegroundColor Cyan
Write-Host "                                                                                        yd    ``+````+hMm.-sdmy./MMMMMMMMMMMMMMMMMMMMMMNNNMMy.  .   . +y        :+``  .sy.                /y:      ``.                                                             " -ForegroundColor Cyan
Write-Host "                                                                                         ``   ``-    /+.yMMMMMNhNMMMMMMMMMMMMMMMMMMMMMMMMMNy.``-o  ``M+ +o        .:   ``                  :hm .ys-``        .                                                      " -ForegroundColor Cyan
Write-Host "                                                                                                ``    dMMMMMMMMMMmdmNMMMMMMMMMMMMMMMMMMMNMMs.d``/. ms  +``                                ``d+-ddMd+``     ``-                                                      " -ForegroundColor Cyan
Write-Host "                                                                                              ``.do  /MMMMMMMMMMMho:-/yNMMMMMMMMMMMMMMMN.++ hN-.  .+/            ``  -     ````             :hMMmdyoy -. ``  .:``                                                   " -ForegroundColor Cyan
Write-Host "                                                                                         .hd+  ``ms  NMMMMMMMMMMMMMMNhsosmMMMMMMMMMMMMMy    Nm``.       ``:        .                         /s.                                                                 " -ForegroundColor Cyan
