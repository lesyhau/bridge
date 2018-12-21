
source m3w_osctst_pin_i2c.tcl

set	STBN    $::iic0_stby
set	CONTA   $::iic0_conta
set	CONTB   $::iic0_contb
set	PUE1    $::iic0_sda_pue
set	I1      $::iic0_sda_i
set	CIN1    $::iic0_sda_cin
set PAD1    $::SDA0
set	PUE2    $::iic0_scl_pue
set	I2      $::iic0_scl_i
set	CIN2    $::iic0_scl_cin
set PAD2    $::SCL0

proc force_signal { signal value } {
    force $signal $value
}

proc release_signal { signal } {
    release $signal
}

proc osctst_mode19 {} {
    force_signal $::MT_MODE4 1
    force_signal $::MT_MODE3 0
    force_signal $::MT_MODE2 0
    force_signal $::MT_MODE1 1
    force_signal $::MT_MODE0 1
    puts "\[Info\] Set MT_MODE\[4:0\] = 0x13"
}

proc i2c_osctst_start {} {
    puts "\[Info\] Start OSCTST for I2C"
}

proc i2c_osctst_stop {} {
    puts "\[Info\] Stop OSCTST for I2C"
    stop -relative 1fs	-command quit
}

proc set_PAD { pad } {
    force_signal $pad 1
    puts "\[Info\] Set      PAD     $pad"
}

proc clear_PAD { pad } {
    force_signal $pad 0
    puts "\[Info\] Clear    PAD     $pad"
}

proc release_PAD { pad } {
    release_signal $pad
    puts "\[Info\] Release  PAD     $pad"
}

proc set_PUE { pue } {
    force_signal $pue 1
    puts "\[Info\] Set      PUE     $pue"
}

proc clear_PUE { pue } {
    force_signal $pue 0
    puts "\[Info\] Clear    PUE     $pue"
}

proc set_CONTA { conta } {
    force_signal $conta 1
    puts "\[Info\] Set      CONTA   $conta"
}

proc clear_CONTA { conta } {
    force_signal $conta 0
    puts "\[Info\] Clear    CONTA   $conta"
}

proc set_CONTB { contb } {
    force_signal $contb 1
    puts "\[Info\] Set      CONTB   $contb"
}

proc clear_CONTB { contb } {
    force_signal $contb 0
    puts "\[Info\] Clear    CONTB   $contb"
}

proc set_I { i } {
    force_signal $i 1
    puts "\[Info\] Set      I       $i"
}

proc clear_I { i } {
    force_signal $i 0
    puts "\[Info\] Clear    I       $i"
}

proc set_STBN { stbn } {
    force_signal $stbn 1
    puts "\[Info\] Set      STBN    $stbn"
}

proc clear_STBN { stbn } {
    force_signal $stbn 0
    puts "\[Info\] Clear    STBN    $stbn"
}

proc cmp { nid value } {
    if { [get_v %x $nid] == $value } {
        return 1
    } else {
        return 0
    }
}

proc cmpnid { nid1 nid2 } {
    if { [get_v %x $nid1] == [get_v %x $nid2] } {
        return 1
    } else {
        return 0
    }
}

set mode 0
stop    -absolute   352000ns 	-command    { set mode 1            }   -continue   -quiet
stop    -absolute   368000ns	-command    { set mode 2            }   -continue   -quiet
stop    -absolute   376000ns	-command    { set mode 3            }   -continue   -quiet
stop    -absolute   384000ns	-command    { set mode 4            }   -continue   -quiet
stop    -absolute   392000ns	-command    { set mode 0            }   -continue   -quiet

proc check_cell1 {} {
    # Case A check
    if {$::mode == 1} {
        if {[cmp $::STBN 'h0] == 1} {
            if {[cmp $::CIN1 'h1] == 1} {
                puts "\[OSCTST\]\[A\]\[CELL1\] PASS"
            } else {
                puts "\[OSCTST\]\[A\]\[CELL1\] FAIL"
                puts "[get_v %x $::CIN1] # 'h1"
            }
        }
    # Case B check
    } elseif {$::mode == 2} {
        if {[cmp $::STBN 'h1] == 1} {
            if {[cmp $::I1 'h1] == 1} {
                if {[cmpnid $::PAD1 $::CIN1] == 1} {
                    puts "\[OSCTST\]\[B\]\[CELL1\] PASS"
                } else {
                    puts "\[OSCTST\]\[B\]\[CELL1\] FAIL"
                    puts "[get_v %x $::PAD1] # [get_v %x $::CIN1]"
                }
            }
        }
    # Case C check
    } elseif {$::mode == 3} {
        if {[cmp $::PAD1 'hz] == 1} {
            puts "\[OSCTST\]\[C\]\[CELL1\] PASS"
        } else {
            puts "\[OSCTST\]\[C\]\[CELL1\] FAIL"
            puts "[get_v %x $::PAD1] # 'hz"
        }
    # Case D check
    } elseif {$::mode == 4} {
        if {[cmp $::I1 'h0] == 1} {
            if {[cmp $::PAD1 'h0] == 1} {
                puts "\[OSCTST\]\[D\]\[CELL1\] PASS"
            } else {
                puts "\[OSCTST\]\[D\]\[CELL1\] FAIL"
                puts "[get_v %x $::I1] # [get_v %x $::PAD1]"
            }
        } elseif {[cmp $::I1 'h1] == 1} {
            if {[cmp $::PAD1 'hz] == 1} {
                puts "\[OSCTST\]\[D\]\[CELL1\] PASS"
            } else {
                puts "\[OSCTST\]\[D\]\[CELL1\] FAIL"
                puts "[get_v %x $::I1] # [get_v %x $::PAD1]"
            }
        }
    }

    stop -relative 500ns	-command check_cell1 -continue -quiet
}

proc check_cell2 {} {
    # Case A check
    if {$::mode == 1} {
        if {[cmp $::STBN 'h0] == 1} {
            if {[cmp $::CIN2 'h1] == 1} {
                puts "\[OSCTST\]\[A\]\[CELL2\] PASS"
            } else {
                puts "\[OSCTST\]\[A\]\[CELL2\] FAIL"
                puts "[get_v %x $::CIN2] # 'h1"
            }
        }
    # Case B check
    } elseif {$::mode == 2} {
        if {[cmp $::STBN 'h1] == 1} {
            if {[cmp $::I2 'h1] == 1} {
                if {[cmpnid $::PAD2 $::CIN2] == 1} {
                    puts "\[OSCTST\]\[B\]\[CELL2\] PASS"
                } else {
                    puts "\[OSCTST\]\[B\]\[CELL2\] FAIL"
                    puts "[get_v %x $::PAD2] # [get_v %x $::CIN2]"
                }
            }
        }
    # Case C check
    } elseif {$::mode == 3} {
        if {[cmp $::PAD2 'hz] == 1} {
            puts "\[OSCTST\]\[C\]\[CELL2\] PASS"
        } else {
            puts "\[OSCTST\]\[C\]\[CELL2\] FAIL"
            puts "[get_v %x $::PAD2] # 'hz"
        }
    # Case D check
    } elseif {$::mode == 4} {
        if {[cmp $::I2 'h0] == 1} {
            if {[cmp $::PAD2 'h0] == 1} {
                puts "\[OSCTST\]\[D\]\[CELL2\] PASS"
            } else {
                puts "\[OSCTST\]\[D\]\[CELL2\] FAIL"
                puts "[get_v %x $::I2] # [get_v %x $::PAD2]"
            }
        } elseif {[cmp $::I2 'h1] == 1} {
            if {[cmp $::PAD2 'hz] == 1} {
                puts "\[OSCTST\]\[D\]\[CELL2\] PASS"
            } else {
                puts "\[OSCTST\]\[D\]\[CELL2\] FAIL"
                puts "[get_v %x $::I2] # [get_v %x $::PAD2]"
            }
        }
    }

    stop -relative 500ns	-command check_cell2 -continue -quiet
}

stop	-absolute   0ns         -command osctst_mode19      -continue   -quiet
stop	-absolute   352000ns    -command i2c_osctst_start   -continue   -quiet
stop	-absolute   400000ns    -command i2c_osctst_stop    -continue   -quiet
stop	-absolute   352250ns    -command check_cell1        -continue   -quiet
stop	-absolute   352250ns    -command check_cell2        -continue   -quiet

# Initial value
force $CONTB    0
force $CONTA    0
force $PUE1     0
force $PUE2     0
force $I1       0
force $I2       0
force $STBN     0

# Input check
stop	-absolute	352000ns	-command	{ clear_PAD    $PAD1	}	-continue   -quiet
stop	-absolute	352500ns	-command	{ set_PAD      $PAD1	}	-continue   -quiet
stop	-absolute	353000ns	-command	{ clear_PAD    $PAD1	}	-continue   -quiet
stop	-absolute	353500ns	-command	{ set_PAD      $PAD1	}	-continue   -quiet
stop	-absolute	354000ns	-command	{ clear_PAD    $PAD1	}	-continue   -quiet
stop	-absolute	354500ns	-command	{ set_PAD      $PAD1	}	-continue   -quiet
stop	-absolute	355000ns	-command	{ clear_PAD    $PAD1	}	-continue   -quiet
stop	-absolute	355500ns	-command	{ set_PAD      $PAD1	}	-continue   -quiet
stop	-absolute	356000ns	-command	{ clear_PAD    $PAD1	}	-continue   -quiet
stop	-absolute	356500ns	-command	{ set_PAD      $PAD1	}	-continue   -quiet
stop	-absolute	357000ns	-command	{ clear_PAD    $PAD1	}	-continue   -quiet
stop	-absolute	357500ns	-command	{ set_PAD      $PAD1	}	-continue   -quiet
stop	-absolute	358000ns	-command	{ clear_PAD    $PAD1	}	-continue   -quiet
stop	-absolute	358500ns	-command	{ set_PAD      $PAD1	}	-continue   -quiet
stop	-absolute	359000ns	-command	{ clear_PAD    $PAD1	}	-continue   -quiet
stop	-absolute	359500ns	-command	{ set_PAD      $PAD1	}	-continue   -quiet
stop	-absolute	360000ns	-command	{ clear_PAD    $PAD1	}	-continue   -quiet
stop	-absolute	360500ns	-command	{ set_PAD      $PAD1	}	-continue   -quiet
stop	-absolute	361000ns	-command	{ clear_PAD    $PAD1	}	-continue   -quiet
stop	-absolute	361500ns	-command	{ set_PAD      $PAD1	}	-continue   -quiet
stop	-absolute	362000ns	-command	{ clear_PAD    $PAD1	}	-continue   -quiet
stop	-absolute	362500ns	-command	{ set_PAD      $PAD1	}	-continue   -quiet
stop	-absolute	363000ns	-command	{ clear_PAD    $PAD1	}	-continue   -quiet
stop	-absolute	363500ns	-command	{ set_PAD      $PAD1	}	-continue   -quiet
stop	-absolute	364000ns	-command	{ clear_PAD    $PAD1	}	-continue   -quiet
stop	-absolute	364500ns	-command	{ set_PAD      $PAD1	}	-continue   -quiet
stop	-absolute	365000ns	-command	{ clear_PAD    $PAD1	}	-continue   -quiet
stop	-absolute	365500ns	-command	{ set_PAD      $PAD1	}	-continue   -quiet
stop	-absolute	366000ns	-command	{ clear_PAD    $PAD1	}	-continue   -quiet
stop	-absolute	366500ns	-command	{ set_PAD      $PAD1	}	-continue   -quiet
stop	-absolute	367000ns	-command	{ clear_PAD    $PAD1	}	-continue   -quiet
stop	-absolute	367500ns	-command	{ set_PAD      $PAD1	}	-continue   -quiet
stop	-absolute	368000ns	-command	{ clear_PAD    $PAD1	}	-continue   -quiet
stop	-absolute	368500ns	-command	{ set_PAD      $PAD1	}	-continue   -quiet
stop	-absolute	369000ns	-command	{ clear_PAD    $PAD1	}	-continue   -quiet
stop	-absolute	369500ns	-command	{ set_PAD      $PAD1	}	-continue   -quiet
stop	-absolute	370000ns	-command	{ clear_PAD    $PAD1	}	-continue   -quiet
stop	-absolute	370500ns	-command	{ set_PAD      $PAD1	}	-continue   -quiet
stop	-absolute	371000ns	-command	{ clear_PAD    $PAD1	}	-continue   -quiet
stop	-absolute	371500ns	-command	{ set_PAD      $PAD1	}	-continue   -quiet
stop	-absolute	372000ns	-command	{ clear_PAD    $PAD1	}	-continue   -quiet
stop	-absolute	372500ns	-command	{ set_PAD      $PAD1	}	-continue   -quiet
stop	-absolute	373000ns	-command	{ clear_PAD    $PAD1	}	-continue   -quiet
stop	-absolute	373500ns	-command	{ set_PAD      $PAD1	}	-continue   -quiet
stop	-absolute	374000ns	-command	{ clear_PAD    $PAD1	}	-continue   -quiet
stop	-absolute	374500ns	-command	{ set_PAD      $PAD1	}	-continue   -quiet
stop	-absolute	375000ns	-command	{ clear_PAD    $PAD1	}	-continue   -quiet
stop	-absolute	375500ns	-command	{ set_PAD      $PAD1	}	-continue   -quiet
# Output check      
stop	-absolute	376000ns	-command	{ release_PAD  $PAD1	}	-continue   -quiet
# tICF check        
stop	-absolute	395000ns	-command	{ set_PAD      $PAD1	}	-continue   -quiet
stop	-absolute	395500ns	-command	{ release_PAD  $PAD1	}	-continue   -quiet
                    
# Input check       
stop	-absolute	352000ns	-command	{ clear_PAD    $PAD2	}	-continue   -quiet
stop	-absolute	352500ns	-command	{ set_PAD      $PAD2	}	-continue   -quiet
stop	-absolute	353000ns	-command	{ clear_PAD    $PAD2	}	-continue   -quiet
stop	-absolute	353500ns	-command	{ set_PAD      $PAD2	}	-continue   -quiet
stop	-absolute	354000ns	-command	{ clear_PAD    $PAD2	}	-continue   -quiet
stop	-absolute	354500ns	-command	{ set_PAD      $PAD2	}	-continue   -quiet
stop	-absolute	355000ns	-command	{ clear_PAD    $PAD2	}	-continue   -quiet
stop	-absolute	355500ns	-command	{ set_PAD      $PAD2	}	-continue   -quiet
stop	-absolute	356000ns	-command	{ clear_PAD    $PAD2	}	-continue   -quiet
stop	-absolute	356500ns	-command	{ set_PAD      $PAD2	}	-continue   -quiet
stop	-absolute	357000ns	-command	{ clear_PAD    $PAD2	}	-continue   -quiet
stop	-absolute	357500ns	-command	{ set_PAD      $PAD2	}	-continue   -quiet
stop	-absolute	358000ns	-command	{ clear_PAD    $PAD2	}	-continue   -quiet
stop	-absolute	358500ns	-command	{ set_PAD      $PAD2	}	-continue   -quiet
stop	-absolute	359000ns	-command	{ clear_PAD    $PAD2	}	-continue   -quiet
stop	-absolute	359500ns	-command	{ set_PAD      $PAD2	}	-continue   -quiet
stop	-absolute	360000ns	-command	{ clear_PAD    $PAD2	}	-continue   -quiet
stop	-absolute	360500ns	-command	{ set_PAD      $PAD2	}	-continue   -quiet
stop	-absolute	361000ns	-command	{ clear_PAD    $PAD2	}	-continue   -quiet
stop	-absolute	361500ns	-command	{ set_PAD      $PAD2	}	-continue   -quiet
stop	-absolute	362000ns	-command	{ clear_PAD    $PAD2	}	-continue   -quiet
stop	-absolute	362500ns	-command	{ set_PAD      $PAD2	}	-continue   -quiet
stop	-absolute	363000ns	-command	{ clear_PAD    $PAD2	}	-continue   -quiet
stop	-absolute	363500ns	-command	{ set_PAD      $PAD2	}	-continue   -quiet
stop	-absolute	364000ns	-command	{ clear_PAD    $PAD2	}	-continue   -quiet
stop	-absolute	364500ns	-command	{ set_PAD      $PAD2	}	-continue   -quiet
stop	-absolute	365000ns	-command	{ clear_PAD    $PAD2	}	-continue   -quiet
stop	-absolute	365500ns	-command	{ set_PAD      $PAD2	}	-continue   -quiet
stop	-absolute	366000ns	-command	{ clear_PAD    $PAD2	}	-continue   -quiet
stop	-absolute	366500ns	-command	{ set_PAD      $PAD2	}	-continue   -quiet
stop	-absolute	367000ns	-command	{ clear_PAD    $PAD2	}	-continue   -quiet
stop	-absolute	367500ns	-command	{ set_PAD      $PAD2	}	-continue   -quiet
stop	-absolute	368000ns	-command	{ clear_PAD    $PAD2	}	-continue   -quiet
stop	-absolute	368500ns	-command	{ set_PAD      $PAD2	}	-continue   -quiet
stop	-absolute	369000ns	-command	{ clear_PAD    $PAD2	}	-continue   -quiet
stop	-absolute	369500ns	-command	{ set_PAD      $PAD2	}	-continue   -quiet
stop	-absolute	370000ns	-command	{ clear_PAD    $PAD2	}	-continue   -quiet
stop	-absolute	370500ns	-command	{ set_PAD      $PAD2	}	-continue   -quiet
stop	-absolute	371000ns	-command	{ clear_PAD    $PAD2	}	-continue   -quiet
stop	-absolute	371500ns	-command	{ set_PAD      $PAD2	}	-continue   -quiet
stop	-absolute	372000ns	-command	{ clear_PAD    $PAD2	}	-continue   -quiet
stop	-absolute	372500ns	-command	{ set_PAD      $PAD2	}	-continue   -quiet
stop	-absolute	373000ns	-command	{ clear_PAD    $PAD2	}	-continue   -quiet
stop	-absolute	373500ns	-command	{ set_PAD      $PAD2	}	-continue   -quiet
stop	-absolute	374000ns	-command	{ clear_PAD    $PAD2	}	-continue   -quiet
stop	-absolute	374500ns	-command	{ set_PAD      $PAD2	}	-continue   -quiet
stop	-absolute	375000ns	-command	{ clear_PAD    $PAD2	}	-continue   -quiet
stop	-absolute	375500ns	-command	{ set_PAD      $PAD2	}	-continue   -quiet
# Output check      
stop	-absolute	376000ns	-command	{ release_PAD  $PAD2	}	-continue   -quiet
# tICF check        
stop	-absolute	395000ns	-command	{ set_PAD      $PAD2	}	-continue   -quiet
stop	-absolute	395500ns	-command	{ release_PAD  $PAD2	}	-continue   -quiet

# Input check       
stop	-absolute	352000ns	-command	{ clear_CONTB  $CONTB	}	-continue   -quiet
stop	-absolute	353000ns	-command	{ set_CONTB    $CONTB	}	-continue   -quiet
stop	-absolute	354000ns	-command	{ clear_CONTB  $CONTB	}	-continue   -quiet
stop	-absolute	355000ns	-command	{ set_CONTB    $CONTB	}	-continue   -quiet
stop	-absolute	356000ns	-command	{ clear_CONTB  $CONTB	}	-continue   -quiet
stop	-absolute	357000ns	-command	{ set_CONTB    $CONTB	}	-continue   -quiet
stop	-absolute	358000ns	-command	{ clear_CONTB  $CONTB	}	-continue   -quiet
stop	-absolute	359000ns	-command	{ set_CONTB    $CONTB	}	-continue   -quiet
stop	-absolute	360000ns	-command	{ clear_CONTB  $CONTB	}	-continue   -quiet
stop	-absolute	361000ns	-command	{ set_CONTB    $CONTB	}	-continue   -quiet
stop	-absolute	362000ns	-command	{ clear_CONTB  $CONTB	}	-continue   -quiet
stop	-absolute	363000ns	-command	{ set_CONTB    $CONTB	}	-continue   -quiet
stop	-absolute	364000ns	-command	{ clear_CONTB  $CONTB	}	-continue   -quiet
stop	-absolute	365000ns	-command	{ set_CONTB    $CONTB	}	-continue   -quiet
stop	-absolute	366000ns	-command	{ clear_CONTB  $CONTB	}	-continue   -quiet
stop	-absolute	367000ns	-command	{ set_CONTB    $CONTB	}	-continue   -quiet
stop	-absolute	368000ns	-command	{ clear_CONTB  $CONTB	}	-continue   -quiet
stop	-absolute	369000ns	-command	{ set_CONTB    $CONTB	}	-continue   -quiet
stop	-absolute	370000ns	-command	{ clear_CONTB  $CONTB	}	-continue   -quiet
stop	-absolute	371000ns	-command	{ set_CONTB    $CONTB	}	-continue   -quiet
stop	-absolute	372000ns	-command	{ clear_CONTB  $CONTB	}	-continue   -quiet
stop	-absolute	373000ns	-command	{ set_CONTB    $CONTB	}	-continue   -quiet
stop	-absolute	374000ns	-command	{ clear_CONTB  $CONTB	}	-continue   -quiet
stop	-absolute	375000ns	-command	{ set_CONTB    $CONTB	}	-continue   -quiet
# Output check      
stop	-absolute	376000ns	-command	{ clear_CONTB  $CONTB	}	-continue   -quiet
stop	-absolute	376500ns	-command	{ set_CONTB    $CONTB	}	-continue   -quiet
stop	-absolute	377000ns	-command	{ clear_CONTB  $CONTB	}	-continue   -quiet
stop	-absolute	377500ns	-command	{ set_CONTB    $CONTB	}	-continue   -quiet
stop	-absolute	378000ns	-command	{ clear_CONTB  $CONTB	}	-continue   -quiet
stop	-absolute	378500ns	-command	{ set_CONTB    $CONTB	}	-continue   -quiet
stop	-absolute	379000ns	-command	{ clear_CONTB  $CONTB	}	-continue   -quiet
stop	-absolute	379500ns	-command	{ set_CONTB    $CONTB	}	-continue   -quiet
stop	-absolute	380000ns	-command	{ clear_CONTB  $CONTB	}	-continue   -quiet
stop	-absolute	380500ns	-command	{ set_CONTB    $CONTB	}	-continue   -quiet
stop	-absolute	381000ns	-command	{ clear_CONTB  $CONTB	}	-continue   -quiet
stop	-absolute	381500ns	-command	{ set_CONTB    $CONTB	}	-continue   -quiet
stop	-absolute	382000ns	-command	{ clear_CONTB  $CONTB	}	-continue   -quiet
stop	-absolute	382500ns	-command	{ set_CONTB    $CONTB	}	-continue   -quiet
stop	-absolute	383000ns	-command	{ clear_CONTB  $CONTB	}	-continue   -quiet
stop	-absolute	383500ns	-command	{ set_CONTB    $CONTB	}	-continue   -quiet
stop	-absolute	384000ns	-command	{ clear_CONTB  $CONTB	}	-continue   -quiet
stop	-absolute	384500ns	-command	{ set_CONTB    $CONTB	}	-continue   -quiet
stop	-absolute	385000ns	-command	{ clear_CONTB  $CONTB	}	-continue   -quiet
stop	-absolute	385500ns	-command	{ set_CONTB    $CONTB	}	-continue   -quiet
stop	-absolute	386000ns	-command	{ clear_CONTB  $CONTB	}	-continue   -quiet
stop	-absolute	386500ns	-command	{ set_CONTB    $CONTB	}	-continue   -quiet
stop	-absolute	387000ns	-command	{ clear_CONTB  $CONTB	}	-continue   -quiet
stop	-absolute	387500ns	-command	{ set_CONTB    $CONTB	}	-continue   -quiet
stop	-absolute	388000ns	-command	{ clear_CONTB  $CONTB	}	-continue   -quiet
stop	-absolute	388500ns	-command	{ set_CONTB    $CONTB	}	-continue   -quiet
stop	-absolute	389000ns	-command	{ clear_CONTB  $CONTB	}	-continue   -quiet
stop	-absolute	389500ns	-command	{ set_CONTB    $CONTB	}	-continue   -quiet
stop	-absolute	390000ns	-command	{ clear_CONTB  $CONTB	}	-continue   -quiet
stop	-absolute	390500ns	-command	{ set_CONTB    $CONTB	}	-continue   -quiet
stop	-absolute	391000ns	-command	{ clear_CONTB  $CONTB	}	-continue   -quiet
stop	-absolute	391500ns	-command	{ set_CONTB    $CONTB	}	-continue   -quiet
stop	-absolute	392000ns	-command	{ clear_CONTB  $CONTB	}	-continue   -quiet
                    
# Input check       
stop	-absolute	352000ns	-command	{ clear_CONTA  $CONTA	}	-continue   -quiet
stop	-absolute	354000ns	-command	{ set_CONTA    $CONTA	}	-continue   -quiet
stop	-absolute	356000ns	-command	{ clear_CONTA  $CONTA	}	-continue   -quiet
stop	-absolute	358000ns	-command	{ set_CONTA    $CONTA	}	-continue   -quiet
stop	-absolute	360000ns	-command	{ clear_CONTA  $CONTA	}	-continue   -quiet
stop	-absolute	362000ns	-command	{ set_CONTA    $CONTA	}	-continue   -quiet
stop	-absolute	364000ns	-command	{ clear_CONTA  $CONTA	}	-continue   -quiet
stop	-absolute	366000ns	-command	{ set_CONTA    $CONTA	}	-continue   -quiet
stop	-absolute	368000ns	-command	{ clear_CONTA  $CONTA	}	-continue   -quiet
stop	-absolute	370000ns	-command	{ set_CONTA    $CONTA	}	-continue   -quiet
stop	-absolute	372000ns	-command	{ clear_CONTA  $CONTA	}	-continue   -quiet
stop	-absolute	374000ns	-command	{ set_CONTA    $CONTA	}	-continue   -quiet
# Output check      
stop	-absolute	376000ns	-command	{ clear_CONTA  $CONTA	}	-continue   -quiet
stop	-absolute	377000ns	-command	{ set_CONTA    $CONTA	}	-continue   -quiet
stop	-absolute	378000ns	-command	{ clear_CONTA  $CONTA	}	-continue   -quiet
stop	-absolute	379000ns	-command	{ set_CONTA    $CONTA	}	-continue   -quiet
stop	-absolute	380000ns	-command	{ clear_CONTA  $CONTA	}	-continue   -quiet
stop	-absolute	381000ns	-command	{ set_CONTA    $CONTA	}	-continue   -quiet
stop	-absolute	382000ns	-command	{ clear_CONTA  $CONTA	}	-continue   -quiet
stop	-absolute	383000ns	-command	{ set_CONTA    $CONTA	}	-continue   -quiet
stop	-absolute	384000ns	-command	{ clear_CONTA  $CONTA	}	-continue   -quiet
stop	-absolute	385000ns	-command	{ set_CONTA    $CONTA	}	-continue   -quiet
stop	-absolute	386000ns	-command	{ clear_CONTA  $CONTA	}	-continue   -quiet
stop	-absolute	387000ns	-command	{ set_CONTA    $CONTA	}	-continue   -quiet
stop	-absolute	388000ns	-command	{ clear_CONTA  $CONTA	}	-continue   -quiet
stop	-absolute	389000ns	-command	{ set_CONTA    $CONTA	}	-continue   -quiet
stop	-absolute	390000ns	-command	{ clear_CONTA  $CONTA	}	-continue   -quiet
stop	-absolute	391000ns	-command	{ set_CONTA    $CONTA	}	-continue   -quiet
stop	-absolute	392000ns	-command	{ clear_CONTA  $CONTA	}	-continue   -quiet
                    
# Input check       
stop	-absolute	352000ns	-command	{ clear_PUE    $PUE1	}	-continue   -quiet
stop	-absolute	356000ns	-command	{ set_PUE      $PUE1	}	-continue   -quiet
stop	-absolute	360000ns	-command	{ clear_PUE    $PUE1	}	-continue   -quiet
stop	-absolute	364000ns	-command	{ set_PUE      $PUE1	}	-continue   -quiet
stop	-absolute	368000ns	-command	{ clear_PUE    $PUE1	}	-continue   -quiet
stop	-absolute	372000ns	-command	{ set_PUE      $PUE1	}	-continue   -quiet
# Output check      
stop	-absolute	376000ns	-command	{ clear_PUE    $PUE1	}	-continue   -quiet
stop	-absolute	378000ns	-command	{ set_PUE      $PUE1	}	-continue   -quiet
stop	-absolute	380000ns	-command	{ clear_PUE    $PUE1	}	-continue   -quiet
stop	-absolute	382000ns	-command	{ set_PUE      $PUE1	}	-continue   -quiet
stop	-absolute	384000ns	-command	{ clear_PUE    $PUE1	}	-continue   -quiet
stop	-absolute	386000ns	-command	{ set_PUE      $PUE1	}	-continue   -quiet
stop	-absolute	388000ns	-command	{ clear_PUE    $PUE1	}	-continue   -quiet
stop	-absolute	390000ns	-command	{ set_PUE      $PUE1	}	-continue   -quiet
stop	-absolute	392000ns	-command	{ clear_PUE    $PUE1	}	-continue   -quiet
                    
# Input check       
stop	-absolute	352000ns	-command	{ clear_PUE    $PUE2	}	-continue   -quiet
stop	-absolute	356000ns	-command	{ set_PUE      $PUE2	}	-continue   -quiet
stop	-absolute	360000ns	-command	{ clear_PUE    $PUE2	}	-continue   -quiet
stop	-absolute	364000ns	-command	{ set_PUE      $PUE2	}	-continue   -quiet
stop	-absolute	368000ns	-command	{ clear_PUE    $PUE2	}	-continue   -quiet
stop	-absolute	372000ns	-command	{ set_PUE      $PUE2	}	-continue   -quiet
# Output check      
stop	-absolute	376000ns	-command	{ clear_PUE    $PUE2	}	-continue   -quiet
stop	-absolute	378000ns	-command	{ set_PUE      $PUE2	}	-continue   -quiet
stop	-absolute	380000ns	-command	{ clear_PUE    $PUE2	}	-continue   -quiet
stop	-absolute	382000ns	-command	{ set_PUE      $PUE2	}	-continue   -quiet
stop	-absolute	384000ns	-command	{ clear_PUE    $PUE2	}	-continue   -quiet
stop	-absolute	386000ns	-command	{ set_PUE      $PUE2	}	-continue   -quiet
stop	-absolute	388000ns	-command	{ clear_PUE    $PUE2	}	-continue   -quiet
stop	-absolute	390000ns	-command	{ set_PUE      $PUE2	}	-continue   -quiet
stop	-absolute	392000ns	-command	{ clear_PUE    $PUE2	}	-continue   -quiet
                    
# Input check       
stop	-absolute	352000ns	-command	{ clear_I      $I1	}	-continue   -quiet
stop	-absolute	360000ns	-command	{ set_I        $I1	}	-continue   -quiet
#stop	-absolute	368000ns	-command	{ clear_I      $I1	}	-continue   -quiet
# Output check      
stop	-absolute	376000ns	-command	{ clear_I      $I1	}	-continue   -quiet
stop	-absolute	380000ns	-command	{ set_I        $I1	}	-continue   -quiet
stop	-absolute	384000ns	-command	{ clear_I      $I1	}	-continue   -quiet
stop	-absolute	388000ns	-command	{ set_I        $I1	}	-continue   -quiet
stop	-absolute	392000ns	-command	{ clear_I      $I1	}	-continue   -quiet
# tICF check        
stop	-absolute	395000ns	-command	{ set_I        $I1	}	-continue   -quiet
stop	-absolute	395500ns	-command	{ clear_I      $I1	}	-continue   -quiet
                    
# Input check       
stop	-absolute	352000ns	-command	{ clear_I      $I2	}	-continue   -quiet
stop	-absolute	360000ns	-command	{ set_I        $I2	}	-continue   -quiet
#stop	-absolute	368000ns	-command	{ clear_I      $I2	}	-continue   -quiet
# Output check      
stop	-absolute	376000ns	-command	{ clear_I      $I2	}	-continue   -quiet
stop	-absolute	380000ns	-command	{ set_I        $I2	}	-continue   -quiet
stop	-absolute	384000ns	-command	{ clear_I      $I2	}	-continue   -quiet
stop	-absolute	388000ns	-command	{ set_I        $I2	}	-continue   -quiet
stop	-absolute	392000ns	-command	{ clear_I      $I2	}	-continue   -quiet
# tICF check        
stop	-absolute	395000ns	-command	{ set_I        $I2	}	-continue   -quiet
stop	-absolute	395500ns	-command	{ clear_I      $I2	}	-continue   -quiet
                    
# Input check       
stop	-absolute	352000ns	-command	{ clear_STBN   $STBN	}	-continue   -quiet
stop	-absolute	368000ns	-command	{ set_STBN     $STBN	}	-continue   -quiet
# Output check      
stop	-absolute	376000ns	-command	{ clear_STBN   $STBN	}	-continue   -quiet
stop	-absolute	384000ns	-command	{ set_STBN     $STBN	}	-continue   -quiet
stop	-absolute	392000ns	-command	{ clear_STBN   $STBN	}	-continue   -quiet
# tICF check        
stop	-absolute	395000ns	-command	{ set_STBN     $STBN	}	-continue   -quiet
