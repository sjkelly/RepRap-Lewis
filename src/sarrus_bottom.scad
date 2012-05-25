include <measurements.scad>
use <components.scad>
use <polyholes.scad>
use <sarrus_link.scad>

module sarrus_bottom(){
	difference(){
		union(){
			translate([0,0,sarrus_bottom_thick/2])cube([motor_width,motor_width,sarrus_bottom_thick],center=true);
		for(i = [0 : 90: 360]){
			rotate([0,0,i])translate([0,sarrus_link_thick/2,0])cube([sarrus_top_od/2+sarrus_link_diameter,sarrus_link_thick,sarrus_top_thick]);
			rotate([0,0,i])translate([0,-sarrus_link_thick*3/2,0])cube([sarrus_top_od/2+sarrus_link_diameter,sarrus_link_thick,sarrus_top_thick]);
		}
		}
		for(i = [0 : 90 : 360]){
					rotate([0,0,i])translate([sarrus_top_od/2+sarrus_link_diameter/2,-sarrus_link_thick*3/2-1,sarrus_top_thick/2])rotate([-90,0,0])poly_cylinder(r=screw_diameter/2, h = sarrus_link_thick*4 +2);
					}
		translate([motor_hole_spacing/2,motor_hole_spacing/2,-1])poly_cylinder(r=motor_hole_diameter/2, h = sarrus_bottom_thick+2);
		translate([-motor_hole_spacing/2,motor_hole_spacing/2,-1])poly_cylinder(r=motor_hole_diameter/2, h = sarrus_bottom_thick+2);
		translate([motor_hole_spacing/2,-motor_hole_spacing/2,-1])poly_cylinder(r=motor_hole_diameter/2, h = sarrus_bottom_thick+2);
		translate([-motor_hole_spacing/2,-motor_hole_spacing/2,-1])poly_cylinder(r=motor_hole_diameter/2, h = sarrus_bottom_thick+2);
		translate([0,0,-1])poly_cylinder(r=motor_flange_diameter/2, h = sarrus_bottom_thick+2);
	}
}

module sarrus_bottom_assembly(){
	union(){
		sarrus_bottom();
		translate([motor_hole_spacing/2,motor_hole_spacing/2,sarrus_bottom_thick])washer();
		translate([-motor_hole_spacing/2,motor_hole_spacing/2,sarrus_bottom_thick])washer();
		translate([motor_hole_spacing/2,-motor_hole_spacing/2,sarrus_bottom_thick])washer();
		translate([-motor_hole_spacing/2,-motor_hole_spacing/2,sarrus_bottom_thick])washer();
		translate([motor_hole_spacing/2,motor_hole_spacing/2,sarrus_bottom_thick+washer_thick])rotate([180,0,0])screw(sarrus_bottom_thick+washer_thick+motor_hole_engagement);
		translate([-motor_hole_spacing/2,motor_hole_spacing/2,sarrus_bottom_thick+washer_thick])rotate([180,0,0])screw(sarrus_bottom_thick+washer_thick+motor_hole_engagement);
		translate([motor_hole_spacing/2,-motor_hole_spacing/2,sarrus_bottom_thick+washer_thick])rotate([180,0,0])screw(sarrus_bottom_thick+washer_thick+motor_hole_engagement);
		translate([-motor_hole_spacing/2,-motor_hole_spacing/2,sarrus_bottom_thick+washer_thick])rotate([180,0,0])screw(sarrus_bottom_thick+washer_thick+motor_hole_engagement);
		
		for(i = [0:90:360]){
			rotate([0,0,i])translate([sarrus_top_od/2+sarrus_link_diameter/2,sarrus_link_thick/2,sarrus_link_diameter/2])rotate([90,d_sarrus_bottom,0])sarrus_link();
			rotate([0,0,i])translate([sarrus_top_od/2+sarrus_link_diameter/2,sarrus_link_thick*5/2,sarrus_link_diameter/2])rotate([90,d_sarrus_bottom,0])sarrus_link_assembly();
			rotate([0,0,i])translate([sarrus_top_od/2+sarrus_link_diameter/2,sarrus_link_thick*5/2+washer_thick,sarrus_link_diameter/2])rotate([90,0,0])screw(sarrus_link_thick*4+washer_thick*2+lock_nut_height);
			rotate([0,0,i])translate([sarrus_top_od/2+sarrus_link_diameter/2,sarrus_link_thick*5/2+washer_thick,sarrus_link_diameter/2])rotate([90,0,0])washer();
			rotate([0,0,i])translate([sarrus_top_od/2+sarrus_link_diameter/2,-sarrus_link_thick*3/2,sarrus_link_diameter/2])rotate([90,0,0])washer();
			rotate([0,0,i])translate([sarrus_top_od/2+sarrus_link_diameter/2,-sarrus_link_thick*3/2-washer_thick,sarrus_link_diameter/2])rotate([90,0,0])lock_nut();
		}
	}
}

sarrus_bottom_assembly();