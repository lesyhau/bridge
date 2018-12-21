force {shxsim.shxbrd.u779ahrcarv3u000.rt.rt_c4rc.cr52ss.CR52_SPI[354]} 1'b0
force {shxsim.shxbrd.u779ahrcarv3u000.rt.rt_c4rc.cr52ss.CR52_SPI[355]} 1'b0
force {shxsim.shxbrd.u779ahrcarv3u000.rt.rt_c4rc.cr52ss.CR52_SPI[943]} 1'b0
force {shxsim.shxbrd.u779ahrcarv3u000.rt.rt_c4rc.cr52ss.CR52_SPI[941]} 1'b0
force {shxsim.shxbrd.u779ahrcarv3u000.rt.rt_c4rc.cr52ss.CR52_SPI[939]} 1'b0
force {shxsim.shxbrd.u779ahrcarv3u000.rt.rt_c4rc.cr52ss.CR52_SPI[937]} 1'b0
force {shxsim.shxbrd.u779ahrcarv3u000.rt.rt_c4rc.cr52ss.CR52_SPI[935]} 1'b0
force {shxsim.shxbrd.u779ahrcarv3u000.rt.rt_c4rc.cr52ss.CR52_SPI[933]} 1'b0
force {shxsim.shxbrd.u779ahrcarv3u000.rt.rt_c4rc.cr52ss.CR52_SPI[931]} 1'b0
force {shxsim.shxbrd.u779ahrcarv3u000.rt.rt_c4rc.cr52ss.CR52_SPI[929]} 1'b0

#force {shxsim.shxbrd.u779ahrcarv3u000.rt.rt_c4rc.cr52ss.CR52_BAR[31]} 1'b1
#force {shxsim.shxbrd.u779ahrcarv3u000.rt.rt_c4rc.cr52ss.CR52_BAR[30]} 1'b1
#force {shxsim.shxbrd.u779ahrcarv3u000.rt.rt_c4rc.cr52ss.CR52_BAR[29]} 1'b1
#force {shxsim.shxbrd.u779ahrcarv3u000.rt.rt_c4rc.cr52ss.CR52_BAR[26]} 1'b1
#force {shxsim.shxbrd.u779ahrcarv3u000.rt.rt_c4rc.cr52ss.CR52_BAR[25]} 1'b1
#force {shxsim.shxbrd.u779ahrcarv3u000.rt.rt_c4rc.cr52ss.CR52_BAR[21]} 1'b1
#force {shxsim.shxbrd.u779ahrcarv3u000.rt.rt_c4rc.cr52ss.CR52_BAR[20]} 1'b1

proc cmp { {a} {b} } {
    if { [regexp "^$a$" [get_v %x $b]] == 1 } { 
        return 1
    } else {
        return 0
    }
}

proc force_signals {} {
    if { [cmp 'hcafecafe shxsim.u_cr52_armnet.R10_usr] == 1 } {
        force {shxsim.shxbrd.u779ahrcarv3u000.rt.rt_c4rc.cr52ss.CR52_BAREN} 1'b1
    }
}


stop -command force_signals -continue -event {shxsim.u_cr52_armnet.R10_usr} -quiet
