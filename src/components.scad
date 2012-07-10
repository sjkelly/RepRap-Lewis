include <measurements.scad>
include <polyholes.scad>

$fn = 21;
//make the local screw array a function


module nut(type = screw){
	lscrew_array = get_screw_dims(type);

	lscrew_diameter = lscrew_array[0];
	lnut_diameter = lscrew_array[3] / cos(30);
	lnut_height = lscrew_array[5];
	difference(type = screw){
		union(){
			color("silver")cylinder(r = lnut_diameter/2, h = lnut_height, $fn = 6);
		}
		color("silver")translate([0,0,-eta])cylinder(r = lscrew_diameter/2, h = lnut_height + eta*2);
	}
	echo(str("--", type," nut")); 
}

module lock_nut(type = screw){
	lscrew_array = get_screw_dims(type);

	lscrew_diameter = lscrew_array[0];
	lnut_diameter = lscrew_array[3] / cos(30);
	lnut_apothem = lscrew_array[3] / 2;
	llock_nut_height = lscrew_array[4];

	difference(){
		union(){
			color("silver")cylinder(r = lnut_diameter/2, h = llock_nut_height-lnut_apothem/2, $fn = 6);
			color("silver")translate([0,0,llock_nut_height-lnut_apothem/2])
				rotate_extrude(convexity = 10)translate([lnut_apothem/2,0,0])circle(r = lnut_apothem/2);
		}
		color("silver")translate([0,0,-eta])cylinder(r=lscrew_diameter/2, h = llock_nut_height + eta*2);
	}
	echo(str("--", type," lock nut")); 
}

module motor(){
		union(){
			color("grey")translate([0,0,motor_length/2])cube([motor_width, motor_width, motor_length], center = true);
			color("grey")translate([0,0,motor_length])cylinder(r=motor_flange_diameter/2, h = motor_flange_height);
			color("silver")translate([0,0,motor_length+motor_flange_height])cylinder(r=motor_shaft_diameter/2, h = motor_shaft_length);
		}
	echo(str("--", motor," motor")); 
}

module e0motor(){
		union(){
			color("grey")translate([0,0,e0motor_length/2])cube([e0motor_width, e0motor_width, e0motor_length], center = true);
			color("grey")translate([0,0,e0motor_length])cylinder(r=e0motor_flange_diameter/2, h = e0motor_flange_height);
			color("silver")translate([0,0,e0motor_length+e0motor_flange_height])cylinder(r=e0motor_shaft_diameter/2, h = e0motor_shaft_length);
		}
	echo(str("--", e0motor," motor")); 
}

module screw(length, type = screw){
	lscrew_array = get_screw_dims(type);

	lscrew_diameter = lscrew_array[0];
	lscrew_head_height = lscrew_array[1];
	lscrew_head_diameter = lscrew_array[2];
	

	difference(){
		union(){
			color("grey")translate([0,0,-lscrew_head_height])color("black")
				cylinder(r = lscrew_head_diameter/2, h = lscrew_head_height);
			color("grey")cylinder(r = lscrew_diameter/2, h = round(length));
			
		}
		//make a socket for aesthetics
		color("grey")translate([0,0,-lscrew_head_height-eta])
			color("black")cylinder(r = lscrew_head_diameter/4, h = lscrew_head_height * 3/4, $fn = 6);
	}
	echo(str("--", type, "x", round(length))); 
}

module set_screw(length, type = screw){
	lscrew_array = get_screw_dims(type);

	lscrew_diameter = lscrew_array[0];
	lscrew_head_height = lscrew_array[1];
	lscrew_head_diameter = lscrew_array[2];
	
	difference(){
		union(){
			color("grey")cylinder(r = lscrew_diameter/2, h = round(length));
			
		}
		//make a socket for aesthetics
		color("grey")translate([0,0,-eta])
			cylinder(r = lscrew_head_diameter/5, h = lscrew_head_height * 3/4, $fn = 6);
	}
	echo(str("--", type, "x", round(length), " set screw")); 
}

module washer(type = screw){
	lscrew_array = get_screw_dims(type);

	lscrew_diameter = lscrew_array[0];
	lwasher_diameter = lscrew_array[6];
	lwasher_thick = lscrew_array[7];

	difference(){
		union(){
			color("silver")cylinder(r = lwasher_diameter/2, h = lwasher_thick);
		}
		color("silver")translate([0,0,-eta])cylinder(r = lscrew_diameter/2, h = lwasher_thick + eta * 2);
	}
	echo(str("--", type," washer")); 
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

module extruder_gear(){
	color("silver")difference(){
		color("silver")union(){
			translate([0,0,-extruder_gear_teeth_offset])cylinder(r=extruder_gear_od/2, h=extruder_gear_height);
		}
		translate([0,0,-eta-extruder_gear_teeth_offset])cylinder(r=extruder_gear_id/2, h=extruder_gear_height+eta*2);
		rotate_extrude(convexity = 10)translate([extruder_gear_hobb_diameter/2+extruder_gear_teeth_diameter/2,0,0])circle(r = extruder_gear_teeth_diameter/2);
	}
}

module plunger(radius,length){
	difference(){
		union(){
			color("white")cylinder(r = radius, h = round(length));
		}
	}
	echo(str("--",radius*2,"mm diameter ", round(length), "mm long PTFE plunger")); 
}

