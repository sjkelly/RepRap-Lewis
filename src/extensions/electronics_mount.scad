include <../measurements.scad>
use <components.scad>
use <polyholes.scad>
use <sarrus_link.scad>

module electronics(){
	difference(){
		union(){
			hull()for(i = [0:3]){
				translate(electronics_array[i])cylinder(r=electronics_radius, h = electronics_thick);
			}			
		}
		for(i = [0:3]){
			translate([0,0,-eta])translate(electronics_array[i])cylinder(r=screw_diameter/2, h = electronics_thick+eta*2);
		}
	}
}

module electronics_assembly(){
	union(){
		electronics();
	}
}

electronics_assembly();