include <measurements.scad>
use <components.scad>
use <polyholes.scad>
use <./extensions/extruder.scad>

module foot(){
	difference(){
		union(){
			cube([foot_length-foot_width/2,foot_width,foot_thick]);
			cube([foot_length,foot_width/2,foot_thick]);
			translate([foot_length-foot_width/2,foot_width/2,0])cylinder(r=foot_width/2, h  = foot_thick);
			cube([foot_thick,foot_width,foot_height]);
			hull(){
				translate([foot_length*3/4,foot_width/2,0])rotate([0,0,30])cylinder(r=nut_diameter, h=foot_thick*2, $fn=6);
				translate([foot_length*3/4,nut_diameter,0])rotate([0,0,30])cylinder(r=nut_diameter, h=foot_thick, $fn=6);
			}	
			hull(){
				translate([foot_length/4,foot_width/2,0])rotate([0,0,30])cylinder(r=nut_diameter, h=foot_thick*2, $fn=6);
				translate([foot_length/4,nut_diameter,0])rotate([0,0,30])cylinder(r=nut_diameter, h=foot_thick, $fn=6);
			}
		
		}
		translate([-eta,foot_width/2+washer_diameter/2+nut_apothem,motor_length+sarrus_bottom_thick/2])rotate([0,90,0])poly_cylinder(r=screw_diameter/2, h = foot_thick + eta*2);
		translate([-eta,foot_width/2-washer_diameter/2-nut_apothem,motor_length+sarrus_bottom_thick/2])rotate([0,90,0])poly_cylinder(r=screw_diameter/2, h = foot_thick + eta*2);
		translate([foot_length/4,foot_width/2,-eta])poly_cylinder(r=screw_diameter/2, h = foot_thick + screw_head_diameter + eta*2);
		translate([foot_length*3/4,foot_width/2,-eta])poly_cylinder(r=screw_diameter/2, h = foot_thick + screw_head_diameter + eta*2);
		translate([foot_length/4,foot_width/2,-eta])rotate([0,0,30])cylinder(r=nut_diameter/2, h=foot_thick+eta, $fn=6);
		translate([foot_length*3/4,foot_width/2,-eta])rotate([0,0,30])cylinder(r=nut_diameter/2, h=foot_thick+eta, $fn=6);
	}
}

module extruder_foot(){
	difference(){
		union(){
			cube([foot_thick+washer_thick+screw_head_height+e0motor_length,foot_width,foot_thick]);
			cube([foot_thick,foot_width,foot_height]);
			translate([foot_thick+washer_thick+screw_head_height+e0motor_length,-e0motor_width/2+foot_width/2,0])cube([foot_width/4,e0motor_width,foot_thick+e0motor_width/2-e0motor_flange_diameter/2]);
		
		}
		translate([-eta,foot_width/2+washer_diameter/2+nut_apothem,motor_length+sarrus_bottom_thick/2])rotate([0,90,0])poly_cylinder(r=screw_diameter/2, h = foot_thick + eta*2);
		translate([-eta,foot_width/2-washer_diameter/2-nut_apothem,motor_length+sarrus_bottom_thick/2])rotate([0,90,0])poly_cylinder(r=screw_diameter/2, h = foot_thick + eta*2);

		translate([foot_thick+washer_thick+screw_head_height+e0motor_length-eta,e0motor_hole_spacing/2+foot_width/2,foot_thick+e0motor_width/2-e0motor_hole_spacing/2])rotate([0,90,0])poly_cylinder(r=screw_diameter/2, h = foot_width/4 + eta*2);
		translate([foot_thick+washer_thick+screw_head_height+e0motor_length-eta,-e0motor_hole_spacing/2+foot_width/2,foot_thick+e0motor_width/2-e0motor_hole_spacing/2])rotate([0,90,0])poly_cylinder(r=screw_diameter/2, h = foot_width/4 + eta*2);
					
	}
}

module foot_assembly(){
	union(){
		rotate([0,0,45])translate([motor_width*sqrt(2)/2,-foot_width/2,0])extruder_foot();
		rotate([0,0,135])translate([motor_width*sqrt(2)/2,-foot_width/2,0])foot();
		rotate([0,0,225])translate([motor_width*sqrt(2)/2,-foot_width/2,0])foot();
		rotate([0,0,315])translate([motor_width*sqrt(2)/2,-foot_width/2,0])foot();
		translate([0,0,e0motor_width/2+foot_thick])rotate([-90,0,-45])translate([0,0,motor_width*sqrt(2)/2+foot_thick+washer_thick+screw_head_height])extruder_assembly();
		for(i = [0:90:360]){
			rotate([0,0,45+i])translate([motor_width*sqrt(2)/2+foot_thick+washer_thick,washer_diameter/2+nut_apothem,motor_length+sarrus_bottom_thick/2])rotate([0,-90,0])screw(foot_thick+motor_width*sqrt(2)/2-motor_hole_spacing*sqrt(2)/2);
			rotate([0,0,45+i])translate([motor_width*sqrt(2)/2+foot_thick+washer_thick,-washer_diameter/2-nut_apothem,motor_length+sarrus_bottom_thick/2])rotate([0,-90,0])screw(foot_thick+motor_width*sqrt(2)/2-motor_hole_spacing*sqrt(2)/2);
			rotate([0,0,45+i])translate([motor_width*sqrt(2)/2+foot_thick+washer_thick,washer_diameter/2+nut_apothem,motor_length+sarrus_bottom_thick/2])rotate([0,-90,0])washer();
			rotate([0,0,45+i])translate([motor_width*sqrt(2)/2+foot_thick+washer_thick,-washer_diameter/2-nut_apothem,motor_length+sarrus_bottom_thick/2])rotate([0,-90,0])washer();
		}
	
	}
}

foot_assembly();