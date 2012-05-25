include <measurements.scad>
include <polyholes.scad>

$fn = 31;

module nut(){
	difference(){
		union(){
			color("grey")cylinder(r=nut_diameter/2, h = nut_height, $fn =6);
		}
		color("grey")translate([0,0,-1])cylinder(r=screw_diameter/2, h = nut_height + 2);
	}
	echo(str("--",screw," nut")); 
}

module lock_nut(){
	difference(){
		union(){
			color("grey")cylinder(r=nut_diameter/2, h = lock_nut_height, $fn =6);
		}
		color("grey")translate([0,0,-1])cylinder(r=screw_diameter/2, h = lock_nut_height + 2);
	}
	echo(str("--",screw," lock nut")); 
}

module motor(){
		union(){
			color("grey")translate([0,0,motor_length/2])cube([motor_width, motor_width, motor_length], center = true);
			color("grey")translate([0,0,motor_length])cylinder(r=motor_flange_diameter/2, h = motor_flange_height);
			color("silver")translate([0,0,motor_length+motor_flange_height])cylinder(r=motor_shaft_diameter/2, h = motor_shaft_length);
		}
	echo(str("--",motor," motor")); 
}

module screw(length){
	difference(){
		union(){
			color("grey")translate([0,0,-screw_head_height])color("black")cylinder(r = screw_head_diameter/2, h = screw_head_height);
			color("grey")cylinder(r = screw_diameter/2, h = length);
			
		}
		//make a socket for aesthetics
		color("grey")translate([0,0,-screw_head_height-1])color("black")cylinder(r = screw_head_diameter/4, h = screw_head_height * 3/4, $fn = 6);
	}
	echo(str("--",screw,"x", round(length+0.5))); 
}

module set_screw(length){
	difference(){
		union(){
			color("grey")cylinder(r = screw_diameter/2, h = length);
			
		}
		//make a socket for aesthetics
		color("grey")translate([0,0,-1])color("black")cylinder(r = screw_head_diameter/8, h = screw_head_height * 3/4, $fn = 6);
	}
	echo(str("--",screw,"x", round(length+0.5), " set screw")); 
}

module washer(){
	difference(){
		union(){
			color("silver")cylinder(r=washer_diameter/2, h = washer_thick);
		}
		color("silver")translate([0,0,-1])cylinder(r=screw_diameter/2, h = washer_thick + 2);
	}
	echo(str("--",screw," washer")); 
}

module lead_screw(length){
	difference(){
		union(){
			color("grey")cylinder(r = lead_screw_diameter/2, h = length);
		}
	}
	echo(str("--",lead_screw,"x", round(length+0.5), " lead screw")); 
}


module lead_nut(){
	difference(){
		union(){
			color("grey")cylinder(r=lead_nut_diameter/2, h = lead_nut_height, $fn =6);
		}
		color("grey")translate([0,0,-1])cylinder(r=lead_screw_diameter/2, h = lead_nut_height + 2);
	}
	echo(str("--",lead_screw," lead nut")); 
}
