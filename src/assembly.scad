include <relations.scad>
include <./Magpie/magpie.scad>
use <coupler.scad>
use <sarrus_bottom.scad>
use <sarrus_top.scad>
use <build_bed.scad>
use <truss_top.scad>
use <sweep_link.scad>
use <truss.scad>
use <foot.scad>

$fn = 31;
union()
{
  coupler_assembly();
  translate([0,0,motor_length])sarrus_bottom_assembly();
  translate([0,0,motor_total_length+build_height+coupler_height/2-build_height*$t])sarrus_top_assembly();
  translate([0,0,motor_total_length+build_height+coupler_height/2+sarrus_top_thick-build_height*$t])build_bed_assembly();
  translate([0,0,motor_total_length+build_height+coupler_height/2+sarrus_top_thick+build_bed_thick])truss_top_assembly();
  translate([0,0,motor_total_length*2-motor_shaft_length+build_height+coupler_height/2+sarrus_top_thick+build_bed_thick+truss_top_thick])sweep_link_assembly();
  translate([-motor_width/2,-truss_width/2,motor_length+sarrus_bottom_thick])rotate([0,-90,0])truss_assembly();
  translate([motor_width/2,truss_width/2,motor_length+sarrus_bottom_thick])rotate([0,-90,180])truss_assembly();
  foot_assembly();
}
