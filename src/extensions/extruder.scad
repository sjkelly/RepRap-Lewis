include <../measurements.scad>
use <../components.scad>
use <../polyholes.scad>

module extruder(){
	difference(){
		union(){
			cube([e0motor_width,e0motor_width/2,extruder_thick]);
		}
		translate([e0motor_width/2,e0motor_width/2,-eta])poly_cylinder(r=e0motor_flange_diameter/2, h = e0motor_flange_height + eta);
		translate([e0motor_width/2,e0motor_width/2,-eta])poly_cylinder(r=extruder_gear_od/2+2, h = extruder_thick + eta*2);
		translate([-eta,e0motor_width/2-extruder_gear_od/2-filament_diameter/2,extruder_thick/2])rotate([0,90,0])poly_cylinder(r=2, h = e0motor_width + eta*2);
		translate([e0motor_width/2-e0motor_hole_spacing/2,e0motor_width/2-e0motor_hole_spacing/2,-eta])poly_cylinder(r=screw_diameter/2, h = extruder_thick + eta*2);
		translate([e0motor_width/2+e0motor_hole_spacing/2,e0motor_width/2-e0motor_hole_spacing/2,-eta])poly_cylinder(r=screw_diameter/2, h = extruder_thick + eta*2);
		translate([(e0motor_width-e0motor_hole_spacing)/2,e0motor_width/2-extruder_gear_od/2-filament_diameter/2-m4[3]/2,-eta])cube([m4[5],m4[3],extruder_thick/2+eta]);
		translate([(e0motor_width-e0motor_hole_spacing)/2,e0motor_width/2-extruder_gear_od/2-filament_diameter/2,extruder_thick/2])rotate([0,90,0])cylinder(r=m4[3]/cos(30)/2,h=m4[5],$fn=6);
		translate([e0motor_width-(e0motor_width-e0motor_hole_spacing)/2-m4[5],e0motor_width/2-extruder_gear_od/2-filament_diameter/2-m4[3]/2,-eta])cube([m4[5],m4[3],extruder_thick/2+eta]);
		translate([e0motor_width-(e0motor_width-e0motor_hole_spacing)/2-m4[5],e0motor_width/2-extruder_gear_od/2-filament_diameter/2,extruder_thick/2])rotate([0,90,0])cylinder(r=m4[3]/cos(30)/2,h=m4[5],$fn=6);
		translate([e0motor_width/2,-eta,extruder_thick/2])rotate([-90,0,0])poly_cylinder(r=screw_diameter/2, h = e0motor_width/2 + eta*2);
		translate([e0motor_width/2-nut_apothem,0,-eta])cube([nut_apothem*2,lock_nut_height,extruder_thick/2+eta]);
		#translate([e0motor_width/2,0,extruder_thick/2])rotate([-90,30,0])cylinder(r=nut_diameter/2, h=lock_nut_height, $fn=6);
	}
}

module extruder_assembly(){
	union(){
		translate([-e0motor_width/2,-e0motor_width/2,e0motor_length])extruder();
		//e0motor();
		translate([0,0,e0motor_length+extruder_thick/2])extruder_gear();
		translate([e0motor_width-(e0motor_width-e0motor_hole_spacing)/2-m4[5],e0motor_width/2-extruder_gear_od/2-filament_diameter/2,extruder_thick/2])translate([-e0motor_width/2,-e0motor_width/2,e0motor_length])rotate([0,90,0])nut("M4");
		translate([(e0motor_width-e0motor_hole_spacing)/2,e0motor_width/2-extruder_gear_od/2-filament_diameter/2,extruder_thick/2])translate([-e0motor_width/2,-e0motor_width/2,e0motor_length])rotate([0,90,0])nut("M4");
	}
}

extruder_assembly();