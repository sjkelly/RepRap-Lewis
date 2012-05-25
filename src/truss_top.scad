include <measurements.scad>
use <components.scad>
use <polyholes.scad>

module truss_top(){
	difference(){
		union(){
			translate([0,0,truss_top_thick/2])cube([motor_width,motor_width,truss_top_thick],center=true);
		}
		translate([motor_hole_spacing/2,motor_hole_spacing/2,-1])poly_cylinder(r=motor_hole_diameter/2, h = truss_top_thick+2);
		translate([-motor_hole_spacing/2,motor_hole_spacing/2,-1])poly_cylinder(r=motor_hole_diameter/2, h = truss_top_thick+2);
		translate([motor_hole_spacing/2,-motor_hole_spacing/2,-1])poly_cylinder(r=motor_hole_diameter/2, h = truss_top_thick+2);
		translate([-motor_hole_spacing/2,-motor_hole_spacing/2,-1])poly_cylinder(r=motor_hole_diameter/2, h = truss_top_thick+2);
		translate([0,0,-1])poly_cylinder(r=motor_flange_diameter/2, h = sarrus_bottom_thick+2);
	}
}
module truss_top_assembly(){
	translate([0,0,truss_top_thick])union(){
		rotate([180,0,0])truss_top();
		motor();
		translate([motor_hole_spacing/2,motor_hole_spacing/2,-truss_top_thick-washer_thick])washer();
		translate([motor_hole_spacing/2,-motor_hole_spacing/2,-truss_top_thick-washer_thick])washer();
		translate([-motor_hole_spacing/2,motor_hole_spacing/2,-truss_top_thick-washer_thick])washer();
		translate([-motor_hole_spacing/2,-motor_hole_spacing/2,-truss_top_thick-washer_thick])washer();
		translate([motor_hole_spacing/2,motor_hole_spacing/2,-truss_top_thick-washer_thick])screw(truss_top_thick+motor_length);
		translate([motor_hole_spacing/2,-motor_hole_spacing/2,-truss_top_thick-washer_thick])screw(truss_top_thick+motor_length);
		translate([-motor_hole_spacing/2,motor_hole_spacing/2,-truss_top_thick-washer_thick])screw(truss_top_thick+motor_length);
		translate([-motor_hole_spacing/2,-motor_hole_spacing/2,-truss_top_thick-washer_thick])screw(truss_top_thick+motor_length);
	}
}

truss_top_assembly();