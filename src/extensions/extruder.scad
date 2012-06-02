include <../measurements.scad>
use <../components.scad>
use <../polyholes.scad>

module extruder(){
	difference(){
		union(){
		cube([e0motor_width,e0motor_width/2,extruder_thick]);
		}
		translate([e0motor_width/2,e0motor_width/2,-eta])poly_cylinder(r=e0motor_flange_diameter/2, h = e0motor_flange_height + eta);
		translate([e0motor_width/2,e0motor_width/2,-eta])poly_cylinder(r=e_gear_diameter/2+2, h = extruder_thick + eta*2);
		translate([-eta,e0motor_width/2-e_gear_diameter/2-filament_diameter/2,extruder_thick/2])rotate([0,90,0])poly_cylinder(r=filament_diameter/2, h = e0motor_width + eta*2);
		translate([e0motor_width/2-e0motor_hole_spacing/2,e0motor_width/2-e0motor_hole_spacing/2,-eta])poly_cylinder(r=screw_diameter/2, h = extruder_thick + eta*2);
		translate([e0motor_width/2+e0motor_hole_spacing/2,e0motor_width/2-e0motor_hole_spacing/2,-eta])poly_cylinder(r=screw_diameter/2, h = extruder_thick + eta*2);
	}
}

module extruder_assembly(){
	union(){
		extruder();
	}
}

extruder_assembly();