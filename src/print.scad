use <coupler.scad>
use <sarrus_bottom.scad>
use <sarrus_top.scad>
use <sarrus_link.scad>
use <build_bed.scad>
use <truss_top.scad>
use <sweep_link.scad>
use <arc_link.scad>
use <truss.scad>
use <foot.scad>
use <extensions/electronics_mount.scad>

// parts oriented and multiplied in all different ways

//sarrus_bottom();
//truss_top();
//truss();
//rotate([180,0,0])sarrus_top();
rotate([90,0,0])sarrus_link();
//coupler();
//sweep_link();
//arc_link();
//build_bed();
//rotate([90,0,0])foot();
//electronics_mount_l();
//electronics_mount_r();
//extruder_foot();