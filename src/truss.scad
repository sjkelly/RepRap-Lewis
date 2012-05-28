include <measurements.scad>
use <components.scad>
use <polyholes.scad>

module truss(){
	difference(){
		union(){
			intersection(){
				cube([truss_length, truss_width, truss_height]);	
				translate([-eta,truss_width/2,-truss_radius+truss_height])rotate([0,90,0])cylinder(r = truss_radius, h = truss_length + eta *2);
			}
		}
			
			
	}
}
module truss_assembly(){
	union(){
		truss();
	}
}

truss_assembly();
