include <measurements.scad>
use <components.scad>
use <polyholes.scad>
use <sarrus_link.scad>

module sarrus_bottom(){
	difference(){
		union(){
			translate([0,0,sarrus_bottom_thick/2])rotate([0,0,45])cube([motor_width*sqrt(2),motor_width*sqrt(2),sarrus_bottom_thick],center=true);

			translate([motor_flange_diameter/2,-bottom_truss_interface_width/2,0])cube([bottom_truss_interface_length,bottom_truss_interface_width,bottom_truss_interface_height]);
			translate([-motor_flange_diameter/2-bottom_truss_interface_length,-bottom_truss_interface_width/2,0])cube([bottom_truss_interface_length,bottom_truss_interface_width,bottom_truss_interface_height]);
			for(i = [0 : 90: 360]){
			
				rotate([0,0,i])translate([0,-sarrus_link_thick*3/2,0])cube([sarrus_top_od/2+sarrus_link_diameter,sarrus_link_thick*3,sarrus_top_thick]);
			}
		}

		for(i = [0 : 90 : 360]){
			rotate([0,0,-45+i])translate([washer_diameter/2,motor_hole_spacing*sqrt(2)/2-lock_nut_height/2,-eta])cube([nut_apothem*2,lock_nut_height,sarrus_bottom_thick+eta*2]);
			rotate([0,0,-45+i])translate([-washer_diameter/2-nut_apothem*2,motor_hole_spacing*sqrt(2)/2-lock_nut_height/2,-eta])cube([nut_apothem*2,lock_nut_height,sarrus_bottom_thick+eta*2]);
			rotate([90,0,-45+i])translate([washer_diameter/2+nut_apothem,sarrus_bottom_thick/2,motor_flange_diameter/2])poly_cylinder(r=screw_diameter/2, h = motor_width*sqrt(2)/2 + eta);
			rotate([90,0,-45+i])translate([-washer_diameter/2-nut_apothem,sarrus_bottom_thick/2,motor_flange_diameter/2])poly_cylinder(r=screw_diameter/2, h = motor_width*sqrt(2)/2 + eta);
			rotate([0,0,i])translate([sarrus_top_od/2-1,-sarrus_link_thick/2,-eta])cube([sarrus_link_diameter+2,sarrus_link_thick,sarrus_top_thick+eta*2]);
			rotate([0,0,i])translate([sarrus_top_od/2+sarrus_link_diameter/2,-sarrus_link_thick*3/2-1,sarrus_top_thick/2])rotate([-90,0,0])poly_cylinder(r=screw_diameter/2, h = sarrus_link_thick*4 +2);
			rotate([0,0,i])translate([motor_hole_spacing/2,motor_hole_spacing/2,-1])poly_cylinder(r=motor_hole_diameter/2, h = sarrus_bottom_thick+2);
		
		}
		
		translate([0,0,-1])poly_cylinder(r=motor_flange_diameter/2, h = sarrus_bottom_thick+2);
	}
}

module sarrus_bottom_assembly(){
	union(){
		sarrus_bottom();
	
		for(i = [0:90:360]){
			rotate([0,0,i])translate([motor_hole_spacing/2,motor_hole_spacing/2,sarrus_bottom_thick])washer();
			rotate([0,0,i])translate([motor_hole_spacing/2,motor_hole_spacing/2,sarrus_bottom_thick+washer_thick])rotate([180,0,0])screw(sarrus_bottom_thick+washer_thick+motor_hole_engagement);
			rotate([0,0,i])translate([sarrus_top_od/2+sarrus_link_diameter/2,sarrus_link_thick/2,sarrus_link_diameter/2])rotate([90,d_sarrus_bottom,0])sarrus_link();
			rotate([0,0,i])translate([sarrus_top_od/2+sarrus_link_diameter/2,sarrus_link_thick*5/2,sarrus_link_diameter/2])rotate([90,d_sarrus_bottom,0])sarrus_link_assembly();
			rotate([0,0,i])translate([sarrus_top_od/2+sarrus_link_diameter/2,sarrus_link_thick*5/2+washer_thick,sarrus_link_diameter/2])rotate([90,0,0])screw(sarrus_link_thick*4+washer_thick*2+lock_nut_height);
			rotate([0,0,i])translate([sarrus_top_od/2+sarrus_link_diameter/2,sarrus_link_thick*5/2+washer_thick,sarrus_link_diameter/2])rotate([90,0,0])washer();
			rotate([0,0,i])translate([sarrus_top_od/2+sarrus_link_diameter/2,-sarrus_link_thick*3/2,sarrus_link_diameter/2])rotate([90,0,0])washer();
			rotate([0,0,i])translate([sarrus_top_od/2+sarrus_link_diameter/2,-sarrus_link_thick*3/2-washer_thick,sarrus_link_diameter/2])rotate([90,0,0])lock_nut();
			rotate([0,0,45+i])translate([motor_hole_spacing*sqrt(2)/2+lock_nut_height/2,washer_diameter/2+nut_apothem,sarrus_bottom_thick/2])rotate([0,-90,0])lock_nut();
			rotate([0,0,45+i])translate([motor_hole_spacing*sqrt(2)/2+lock_nut_height/2,-washer_diameter/2-nut_apothem,sarrus_bottom_thick/2])rotate([0,-90,0])lock_nut();
		}
			

	}
}

sarrus_bottom_assembly();