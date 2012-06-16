include <measurements.scad>
use <components.scad>
use <polyholes.scad>

module sarrus_link(){
	difference(){
		union(){
			hull(){
				translate([0,0,0])cylinder(r=sarrus_link_diameter/2, h = sarrus_link_thick*3);
				translate([sarrus_link_length,0,0])
					cylinder(r=sarrus_link_diameter/2, h = sarrus_link_thick*3);
			}
			translate([-sarrus_link_diameter/2,-sarrus_link_diameter/2,0])
				cube([sarrus_link_length+sarrus_link_diameter,sarrus_link_diameter/2,sarrus_link_thick*3]);
		}
		translate([0,0,-eta])poly_cylinder(r=screw_diameter/2, h = sarrus_link_thick*3+eta*2);
		translate([sarrus_link_length,0,-eta])
			poly_cylinder(r=screw_diameter/2, h = sarrus_link_thick*3+eta*2);
		translate([sarrus_link_length-sarrus_link_diameter/2,-sarrus_link_diameter/2,sarrus_link_thick])rotate([0,0,180-asin((sarrus_link_length-build_height/2)/sarrus_link_length)*2])translate([0,-sarrus_link_diameter,0])cube([sarrus_link_length/2,sarrus_link_diameter+eta,sarrus_link_thick]);
		translate([sarrus_link_length,0,sarrus_link_thick])
			cylinder(r=sarrus_link_diameter/2*sqrt(2)+eta, h=sarrus_link_thick);
		translate([0,0,sarrus_link_thick])
			cylinder(r=sarrus_link_diameter/2*sqrt(2)+eta, h=sarrus_link_thick);
	}
}

module sarrus_link_assembly(){
	union(){
		sarrus_link();
		translate([sarrus_link_length,0,-washer_thick])
			screw(sarrus_link_thick*4+lock_nut_height+washer_thick*2);
		translate([sarrus_link_length,0,-washer_thick])washer();
		translate([sarrus_link_length,0,sarrus_link_thick*4])washer();
		translate([sarrus_link_length,0,washer_thick+sarrus_link_thick*4])lock_nut();
	}
}

sarrus_link_assembly();