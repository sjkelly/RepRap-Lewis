include <../measurements.scad>
use <../components.scad>
use <../polyholes.scad>

module electronics(){
	difference(){
		union(){
			color("green")hull()for(i = [0:3]){
				translate(electronics_array[i])cylinder(r=screw_diameter, h = electronics_thick);
			}			
		}
		for(i = [0:3]){
			translate([0,0,-eta])translate(electronics_array[i])cylinder(r=screw_diameter/2, h = electronics_thick+eta*2);
		}
	}
}

module electronics_mount_l(){
difference(){
		union(){
			translate(electronics_array[0])cylinder(r=screw_diameter*1.5, h = electronics_thick+screw_head_height+washer_thick);
			translate(electronics_array[2])cylinder(r=screw_diameter*1.5, h = electronics_thick+screw_head_height+washer_thick);	
			hull(){
				translate(electronics_array[0])cylinder(r=screw_diameter*1.5, h = electronics_thick);
				translate(electronics_array[2])cylinder(r=screw_diameter*1.5, h = electronics_thick);
			}
			hull(){
				translate(electronics_array[3]/2+[0,foot_length/4+foot_thick,0])cylinder(r=screw_diameter*1.5, h = electronics_thick);
				translate(electronics_array[2])cylinder(r=screw_diameter*1.5, h = electronics_thick);
			}
			hull(){
				translate(electronics_array[3]/2+[0,foot_length/4+foot_thick,0])cylinder(r=screw_diameter*1.5, h = electronics_thick);
				translate(electronics_array[0])cylinder(r=screw_diameter*1.5, h = electronics_thick);
			}

		}
		for(i = [0:3]){
			translate([0,0,-eta])translate(electronics_array[i])poly_cylinder(r=screw_diameter/2, h = electronics_thick+screw_head_height+washer_thick+eta*2);
		}
		translate(electronics_array[3]/2+[0,foot_length/4+foot_thick,-eta])poly_cylinder(r=screw_diameter/2, h = electronics_thick+eta*2);
	}

}

module electronics_mount_r(){
difference(){
		union(){
			translate(electronics_array[1])cylinder(r=screw_diameter*1.5, h = electronics_thick+screw_head_height+washer_thick);
			translate(electronics_array[3])cylinder(r=screw_diameter*1.5, h = electronics_thick+screw_head_height+washer_thick);		
			hull(){
				translate(electronics_array[1])cylinder(r=screw_diameter*1.5, h = electronics_thick);
				translate(electronics_array[3])cylinder(r=screw_diameter*1.5, h = electronics_thick);		
			}
			hull(){
				translate(electronics_array[3]/2+[0,-foot_length/4+foot_thick,0])cylinder(r=screw_diameter*1.5, h = electronics_thick);
				translate(electronics_array[1])cylinder(r=screw_diameter*1.5, h = electronics_thick);
			}
			hull(){
				translate(electronics_array[3]/2+[0,-foot_length/4+foot_thick,0])cylinder(r=screw_diameter*1.5, h = electronics_thick);
				translate(electronics_array[3])cylinder(r=screw_diameter*1.5, h = electronics_thick);
			}
		}
		for(i = [0:3]){
			translate([0,0,-eta])translate(electronics_array[i])poly_cylinder(r=screw_diameter/2, h = electronics_thick+screw_head_height+washer_thick+eta*2);
		}
		translate(electronics_array[3]/2+[0,-foot_length/4+foot_thick,-eta])poly_cylinder(r=screw_diameter/2, h = electronics_thick+eta*2);
	}

}

module electronics_assembly(){
	translate(-electronics_holes[3]/2 + [0,-foot_length/4-foot_thick,0])union(){
		translate([0,0,electronics_thick+screw_head_height+washer_thick])electronics();
		electronics_mount_l();
		electronics_mount_r();
		translate(electronics_holes[3]/2+[0,-foot_length/4+foot_thick,electronics_thick+washer_thick])rotate([180,0,0])screw(electronics_thick+washer_thick+foot_thick*2);
		translate(electronics_holes[3]/2+[0,foot_length/4+foot_thick,electronics_thick+washer_thick])rotate([180,0,0])screw(electronics_thick+washer_thick+foot_thick*2);
		translate(electronics_holes[3]/2+[0,-foot_length/4+foot_thick,electronics_thick+washer_thick])rotate([180,0,0])washer();
		translate(electronics_holes[3]/2+[0,foot_length/4+foot_thick,electronics_thick+washer_thick])rotate([180,0,0])washer();
	}
}

electronics_assembly();
