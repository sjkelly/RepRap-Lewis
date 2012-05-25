$fn = 21;
difference(){
	union(){
		translate([0,0,3])cube([35,35,6],center=true);
		translate([62,0,0])cylinder(r = 19, h = 6);
		translate([0,-7,0])cube([62,14,6]);

	}
	translate([13,13,-1])cylinder(r = 2, h = 8);
	translate([-13,13,-1])cylinder(r = 2, h = 8);
	translate([13,-13,-1])cylinder(r = 2, h = 8);
	translate([-13,-13,-1])cylinder(r = 2, h = 8);
	
	translate([62,-15,-1])cylinder(r = 2, h = 8);
	translate([62,15,-1])cylinder(r = 2, h = 8);
	translate([62+15,0,-1])cylinder(r = 2, h = 8);
	translate([62-15,0,-1])cylinder(r = 2, h = 8);
	
	translate([0,0,-1])cylinder(r = 12, h = 8);
	translate([62,0,-1])cylinder(r = 12, h = 8);
}