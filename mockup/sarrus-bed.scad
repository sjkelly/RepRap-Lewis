$fn = 21;
difference(){
	union(){
		difference(){
			union(){	
				translate([0,0,0])cylinder(r = 32, h = 6,center=true);
				cube([5,64+18,6],center=true);
				cube([64+18,5,6],center=true);
				
			}
			translate([0,0,])cylinder(r = 25, h = 7,center=true);
			for(i = [0:90:360]){
				rotate([90,0,i])translate([32+5,0,0])cylinder(r=1.5, h = 7,center = true);
				rotate([0,0,i])translate([32-3.5,0,0])cylinder(r=1.5, h = 7,center = true);
			}
		
		}
		cube([50,5,6],center=true);
		cylinder(r = 8, h = 6, center = true, $fn = 6);
	}
	translate([0,0,1])cylinder(r = 5.75, h = 5, center = true, $fn = 6);	
	cylinder(r = 3.5, h = 7, center = true);
}