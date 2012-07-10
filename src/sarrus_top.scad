include <measurements.scad>
use <components.scad>
use <polyholes.scad>
use <sarrus_link.scad>

module sarrus_top(){
	difference(){
		union(){
			difference(){
				union(){
					cylinder(r = sarrus_top_od/2, h = sarrus_top_thick);
					for(i = [0 : 90: 360]){
						rotate([0,0,i])translate([0,-sarrus_link_thick/2,0])cube([sarrus_top_od/2+sarrus_link_diameter,sarrus_link_thick,sarrus_top_thick]);
						rotate([0,0,i])translate([0,sarrus_link_thick*3/2,0])cube([sarrus_top_od/2+sarrus_link_diameter,sarrus_link_thick,sarrus_top_thick]);
					}
					}
				translate([0,0,-1])cylinder(r=sarrus_top_id/2, h = sarrus_top_thick +2);
				for(i = [0 : 45 : 360]){
					rotate([0,0,i])translate([(sarrus_top_od+sarrus_top_id)/4,0,-eta])poly_cylinder(r=screw_diameter/2, h = sarrus_top_thick +2);
					rotate([0,0,i])translate([(sarrus_top_od+sarrus_top_id)/4,0,-eta])rotate([0,0,30])cylinder(r=nut_diameter/2, h = lock_nut_height+eta, $fn = 6);
					rotate([0,0,i*2])translate([sarrus_top_od/2+sarrus_link_diameter/2,-sarrus_link_thick/2-1,sarrus_link_diameter/2])rotate([-90,0,0])poly_cylinder(r=screw_diameter/2, h = sarrus_link_thick*4 +2);
					}
				}
				translate([0,0,sarrus_top_thick/2])cube([sarrus_nut_trap,sarrus_top_id, sarrus_top_thick], center = true);
			}
			translate([0,0,-1])poly_cylinder(r=lead_screw_diameter/2, h = sarrus_top_thick +2);
			translate([0,0,-0.1])rotate([0,0,30])cylinder(r=lead_nut_diameter/2, h = lead_nut_height+washer_thick+screw_head_height, $fn = 6);
			translate([0,lead_nut_diameter/2+screw_diameter/2,sarrus_top_thick-nut_height])cylinder(r=nut_diameter/2, h = lock_nut_height + eta, $fn = 6);
			translate([0,lead_nut_diameter/2+screw_diameter/2,-eta])poly_cylinder(r=screw_diameter/2, h = sarrus_top_thick + eta*2);
			translate([0,lead_nut_diameter/2+screw_diameter/2,-eta])
				poly_cylinder(r=washer_diameter/2, h = screw_head_height+washer_thick+eta);
		}	
}

module sarrus_top_assembly(){
	union(){
		sarrus_top();
		translate([0,0,washer_thick+screw_head_height])rotate([0,0,30])nut(lead_screw);
		for(i = [0:90:360]){
			rotate([0,0,i])translate([-sarrus_link_thick*3/2,-sarrus_top_od/2-sarrus_link_diameter/2,sarrus_link_diameter/2])rotate([d_sarrus_top,0,0])rotate([0,90,0])sarrus_link();
			rotate([0,0,i])translate([sarrus_top_od/2+sarrus_link_diameter/2,sarrus_link_thick*5/2+washer_thick,sarrus_link_diameter/2])rotate([90,0,0])screw(sarrus_link_thick*4+washer_thick*2+lock_nut_height);
			rotate([0,0,i])translate([sarrus_top_od/2+sarrus_link_diameter/2,sarrus_link_thick*5/2+washer_thick,sarrus_link_diameter/2])rotate([90,0,0])washer();
			rotate([0,0,i])translate([sarrus_top_od/2+sarrus_link_diameter/2,-sarrus_link_thick*3/2,sarrus_link_diameter/2])rotate([90,0,0])washer();
			rotate([0,0,i])translate([sarrus_top_od/2+sarrus_link_diameter/2,-sarrus_link_thick*3/2-washer_thick,sarrus_link_diameter/2])rotate([90,0,0])lock_nut();
		}
		translate([0,lead_nut_diameter/2+screw_diameter/2,sarrus_top_thick-nut_height])nut();
		translate([0,lead_nut_diameter/2+screw_diameter/2,screw_head_height])washer();
		translate([0,lead_nut_diameter/2+screw_diameter/2,screw_head_height])screw(sarrus_top_thick-screw_head_height);
	}
}

sarrus_top_assembly();