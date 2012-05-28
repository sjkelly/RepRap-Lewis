include <measurements.scad>
use <components.scad>
use <polyholes.scad>

module foot(){
	difference(){
		union(){
			cube([foot_length-foot_width/2,foot_width,foot_thick]);
			translate([foot_length-foot_width/2,foot_width/2,0])cylinder(r=foot_width/2, h  = foot_thick);
			cube([foot_thick,foot_width,foot_height]);
		
		}
		translate([-eta,foot_width/2+washer_diameter/2+nut_apothem,motor_length+sarrus_bottom_thick/2])rotate([0,90,0])poly_cylinder(r=screw_diameter/2, h = foot_thick + eta*2);
		translate([-eta,foot_width/2-washer_diameter/2-nut_apothem,motor_length+sarrus_bottom_thick/2])rotate([0,90,0])poly_cylinder(r=screw_diameter/2, h = foot_thick + eta*2);
		translate([foot_length/2+motor_hole_spacing/2,foot_width/2,-eta])poly_cylinder(r=screw_diameter/2, h = foot_thick + eta*2);
		translate([foot_length/2-motor_hole_spacing/2,foot_width/2,-eta])poly_cylinder(r=screw_diameter/2, h = foot_thick + eta*2);
					
	}
}

module foot_assembly(){
	union(){
		for(i = [0:90:360]){
			rotate([0,0,45+i])translate([motor_width*sqrt(2)/2,-foot_width/2,0])foot();
			rotate([0,0,45+i])translate([motor_width*sqrt(2)/2+foot_thick+washer_thick,washer_diameter/2+nut_apothem,motor_length+sarrus_bottom_thick/2])rotate([0,-90,0])screw(foot_thick+motor_width*sqrt(2)/2-motor_hole_spacing*sqrt(2)/2);
			rotate([0,0,45+i])translate([motor_width*sqrt(2)/2+foot_thick+washer_thick,-washer_diameter/2-nut_apothem,motor_length+sarrus_bottom_thick/2])rotate([0,-90,0])screw(foot_thick+motor_width*sqrt(2)/2-motor_hole_spacing*sqrt(2)/2);
			rotate([0,0,45+i])translate([motor_width*sqrt(2)/2+foot_thick+washer_thick,washer_diameter/2+nut_apothem,motor_length+sarrus_bottom_thick/2])rotate([0,-90,0])washer();
			rotate([0,0,45+i])translate([motor_width*sqrt(2)/2+foot_thick+washer_thick,-washer_diameter/2-nut_apothem,motor_length+sarrus_bottom_thick/2])rotate([0,-90,0])washer();



		}
	
	}
}

foot_assembly();