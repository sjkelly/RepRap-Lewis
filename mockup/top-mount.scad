$fn = 21;
difference(){
	union(){	
		translate([0,0,0])cylinder(r = 24, h = 8,center=true);
		
		translate([-8,15,0])cube([16,5,12]);
		translate([-8,-5-15,0])cube([16,5,12]);
		
	}
	translate([0,0,0])cylinder(r = 13, h = 9,center=true);
	translate([13,13,0])cylinder(r = 2, h = 9,center=true);
	translate([-13,13,0])cylinder(r = 2, h = 9,center=true);
	translate([13,-13,0])cylinder(r = 2, h = 9,center=true);
	translate([-13,-13,0])cylinder(r = 2, h = 9,center=true);
	translate([4,21,8])rotate([90,0,0])cylinder(r = 1.5, h = 9);
	translate([-4,21,8])rotate([90,0,0])cylinder(r = 1.5, h = 9);
	translate([4,-21,8])rotate([-90,0,0])cylinder(r = 1.5, h = 9);
	translate([-4,-21,8])rotate([-90,0,0])cylinder(r = 1.5, h = 9);
}
