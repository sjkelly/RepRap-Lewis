$fn = 21;
difference(){
	union(){	
		cube([110,16,4],center=true);
		
	}

	translate([110/2-4,4,0])cylinder(r = 1.5, h = 9,center=true);
	translate([110/2-4,-4,0])cylinder(r = 1.5, h = 9,center=true);
	translate([-110/2+4,4,0])cylinder(r = 1.5, h = 9,center=true);
	translate([-110/2+4,-4,0])cylinder(r = 1.5, h = 9,center=true);


}
