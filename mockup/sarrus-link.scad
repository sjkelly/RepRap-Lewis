$fn = 21;
difference(){
	union(){
		hull(){
			translate([0,0,0])cylinder(r = 4, h = 5);
			translate([70,0,0])cylinder(r = 4, h = 5);
		}
	}
	translate([0,0,-1])cylinder(r = 1.5, h = 7);
	translate([70,0,-1])cylinder(r = 1.5, h = 7);

}