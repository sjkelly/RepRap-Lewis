$fn = 21;
difference(){
	union(){
		hull(){
			cylinder(r = 8, h = 6);
			translate([62,0,0])cylinder(r = 8, h = 6);
		}


	}
	translate([0,0,-1])cylinder(r = 2.5, h = 8);
	translate([62,0,-1])cylinder(r = 2.5, h = 8);
	translate([-1,0,3])rotate([0,-90,0])cylinder(r = 1.5, h = 8);
	translate([62,0,3])rotate([0,90,0])cylinder(r = 1.5, h = 8);
	translate([-2.5-2.6,-2.8,-1])cube([2.5,5.6,8]);
	translate([62+2.6,-2.8,-1])cube([2.5,5.6,8]);
}