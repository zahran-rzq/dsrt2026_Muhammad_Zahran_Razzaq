v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 40 40 80 40 {lab=in}
N 40 -100 40 40 {lab=in}
N 40 -100 80 -100 {lab=in}
N -20 -30 -20 10 {lab=in}
N -20 -30 40 -30 {lab=in}
N -160 -160 -160 10 {lab=#net1}
N -160 -160 120 -160 {lab=#net1}
N 120 -160 120 -130 {lab=#net1}
N 120 -160 170 -160 {lab=#net1}
N 170 -160 170 -100 {lab=#net1}
N 120 -100 170 -100 {lab=#net1}
N -160 70 -160 100 {lab=0}
N -160 100 -20 100 {lab=0}
N -20 70 -20 100 {lab=0}
N -20 100 120 100 {lab=0}
N 120 70 120 100 {lab=0}
N 120 40 170 40 {lab=0}
N 170 40 170 100 {lab=0}
N 120 100 170 100 {lab=0}
N 120 -70 120 10 {lab=out}
N 120 -30 130 -30 {lab=out}
N 130 -30 200 -30 {lab=out}
N -20 100 -20 120 {lab=0}
C {sky130_fd_pr/nfet_01v8.sym} 100 40 0 0 {name=M1
W=1
L=0.15
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 100 -100 0 0 {name=M2
W=1
L=0.15
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {vsource.sym} -160 40 0 0 {name=V1 
value=1.8 
savecurrent=false}
C {vsource.sym} -20 40 0 0 {name=V2 
*value=2 
value = "PULSE(0 1.8 1n 10p 10p 4n 10n)"
savecurrent=false}
C {lab_pin.sym} -20 -30 0 0 {name=p1 sig_type=std_logic lab=in}
C {lab_pin.sym} 200 -30 2 0 {name=p2 sig_type=std_logic lab=out}
C {gnd.sym} -20 120 0 0 {name=l1 lab=0}
C {code.sym} 320 20 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value=".lib /foss/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice tt

.param mc_mm_switch=0
.param mc_pr_switch=1
"}
C {code.sym} 190 20 0 0 {name=spice only_toplevel=false value="
.option wnflag=0
.option savecurrents
.control
save all
*dc v2 0 1.8 0.01
tran 10ps 10ns
plot in out
op
.endc
"}
