/*
Configuration for a RepRap Lewis. Derived parameterizations occur in "measurements.scad".
Check out http://reprap.org/wiki/Lewis for more information.
*/

//What you want
	//Outer radius of the build bed(it is donut shaped because the motor sits in the middle)
	build_radius = 100; //in millimeters 

	//Travel of the build bed in the X axis. Could be smaller depending on hot end length. 
	build_height = 100; //in millimeters

//What you bring to the party
	//Thickness of the build bed in millimeters
	build_bed_thick = 6; //in millimeters

	//Screw standard that will be used throughout the printer.
	//Values are "M2", "M2.5", "M3", "M4", "M5", "M6", "M8" 
	screw = "M3"; //Keep capitalization and quotes

	//Screw standard used for the lead screw. Size equal to shaft diameter is recommended
	//Values are "M2", "M2.5", "M3", "M4", "M5", "M6", "M8"
	lead_screw = "M5"; //Keep capitalization and quotes

	//Electronics used on the printer
	//Values are "Melzi", "Mega", "Printrboard", "Sanguinololu"
	electronics = "Melzi"; //Keep capitalization, quotes and spacing

	//The stepper motors used on the printer.
	//Values are "NEMA8", "NEMA11", "NEMA14", "NEMA17" 
	//Values for brand motors are "Pololu 35x26"
	motor = "Pololu 35x26"; //Keep capitalization, quotes and spacing

	e0motor = "NEMA17";

	//The extruder gear used to drive the filament
	//Supported values are "Arcol8x5", "Arcol11x5", "Arcol11x8", "Arcol13x8"
	extruder_gear = "Arcol8x5";  //Keep capitalization, quotes and spacing

