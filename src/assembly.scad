include <measurements.scad>
use <components.scad>
use <coupler.scad>
use <sarrus_bottom.scad>
use <sarrus_top.scad>
use <build_bed.scad>
use <truss_top.scad>
use <sweep_link.scad>

$fn = 31;
union(){
	coupler_assembly();
	translate([0,0,motor_length])sarrus_bottom_assembly();
	translate([0,0,motor_length+motor_flange_height+motor_shaft_length+build_height+coupler_height/2-build_height*$t])sarrus_top_assembly();
	translate([0,0,motor_length+motor_flange_height+motor_shaft_length+build_height+coupler_height/2+sarrus_top_thick-build_height*$t])build_bed_assembly();
	translate([0,0,motor_length+motor_flange_height+motor_shaft_length+build_height+coupler_height/2+sarrus_top_thick+build_bed_thick])truss_top_assembly();
	translate([0,0,motor_length+motor_flange_height+truss_length+truss_top_thick+motor_shaft_length])sweep_link_assembly();
	
}
