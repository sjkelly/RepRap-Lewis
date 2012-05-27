include <measurements.scad>
include <polyholes.scad>

$fn = 21;

module nut(){
	difference(){
		union(){
			color("silver")cylinder(r = nut_diameter/2, h = nut_height, $fn = 6);
		}
		color("silver")translate([0,0,-eta])cylinder(r = screw_diameter/2, h = nut_height + eta*2);
	}
	echo(str("--", screw," nut")); 
}

module lock_nut(){
	difference(){
		union(){
			color("silver")cylinder(r = nut_diameter/2, h = lock_nut_height-nut_apothem/2, $fn = 6);
			color("silver")translate([0,0,lock_nut_height-nut_apothem/2])
				rotate_extrude(convexity = 10)translate([nut_apothem/2,0,0])circle(r = nut_apothem/2);
		}
		color("silver")translate([0,0,-eta])cylinder(r=screw_diameter/2, h = lock_nut_height + eta*2);
	}
	echo(str("--", screw," lock nut")); 
}

module motor(){
		union(){
			color("grey")translate([0,0,motor_length/2])cube([motor_width, motor_width, motor_length], center = true);
			color("grey")translate([0,0,motor_length])cylinder(r=motor_flange_diameter/2, h = motor_flange_height);
			color("silver")translate([0,0,motor_length+motor_flange_height])cylinder(r=motor_shaft_diameter/2, h = motor_shaft_length);
		}
	echo(str("--", motor," motor")); 
}

module screw(length){
	difference(){
		union(){
			color("grey")translate([0,0,-screw_head_height])color("black")
				cylinder(r = screw_head_diameter/2, h = screw_head_height);
			color("grey")cylinder(r = screw_diameter/2, h = round(length+0.5));
			
		}
		//make a socket for aesthetics
		color("grey")translate([0,0,-screw_head_height-eta])
			color("black")cylinder(r = screw_head_diameter/4, h = screw_head_height * 3/4, $fn = 6);
	}
	echo(str("--", screw, "x", round(length+0.5))); 
}

module set_screw(length){
	difference(){
		union(){
			color("grey")cylinder(r = screw_diameter/2, h = round(length+0.5));
			
		}
		//make a socket for aesthetics
		color("grey")translate([0,0,-eta])
			cylinder(r = screw_head_diameter/5, h = screw_head_height * 3/4, $fn = 6);
	}
	echo(str("--", screw, "x", round(length+0.5), " set screw")); 
}

module washer(){
	difference(){
		union(){
			color("silver")cylinder(r = washer_diameter/2, h = washer_thick);
		}
		color("silver")translate([0,0,-eta])cylinder(r = screw_diameter/2, h = washer_thick + eta * 2);
	}
	echo(str("--", screw," washer")); 
}

module lead_screw(length){
	//don't round up on leadscrew
	difference(){
		union(){
			color("grey")cylinder(r = lead_screw_diameter/2, h = round(length));
		}
	}
	echo(str("--", lead_screw, "x", round(length), "mm lead screw")); 
}


module lead_nut(){
	difference(){
		union(){
			color("silver")cylinder(r = lead_nut_diameter/2, h = lead_nut_height, $fn = 6);
		}
		color("silver")translate([0,0,-eta])
			cylinder(r = lead_screw_diameter/2, h = lead_nut_height + eta* 2);
	}
	echo(str("--", lead_screw," lead nut")); 
}
