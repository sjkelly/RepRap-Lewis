include <configuration.scad>
include <../../Magpie/magpie.scad>

screw_array = get_screw_dims(screw);
lead_screw_array = get_screw_dims(lead_screw);
motor_array = get_stepper_dims(motor);
e0motor_array = get_stepper_dims(e0motor);
electronics_array = get_electronics_holes(electronics);
extruder_gear_array = get_extruder_gear_dims(extruder_gear);

//echo back the configuration
echo("RepRap Lewis build configuration..."); 

if(screw_array == "error")echo("--Error : invalid screw");
else echo(str("--Screw =  ",screw));

if(lead_screw_array == "error")echo("--Error : invalid lead screw");
else echo(str("--Lead Screw =  ",lead_screw));

if(motor_array == "error")echo("--Error : invalid motor");
else echo(str("--Motor =  ",motor));

if(e0motor_array == "error")echo("--Error : invalid E0 motor");
else echo(str("--E0 Motor =  ",e0motor));

if(electronics_array == "error")echo("--Error : invalid electronics");
else echo(str("--Electronics =  ",electronics));

if(extruder_gear_array == "error")echo("--Error : invalid extruder drive gear");
else echo(str("--Extruder Gear =  ",extruder_gear));

//constants
pi = 3.14159;
phi = 1.618;
eta = 0.1; //used to eliminate coincident faces

//Assign more verbose variables
screw_diameter = screw_array[DIAMETER];
screw_head_height = screw_array[CAP_HEAD_HEIGHT];
screw_head_diameter = screw_array[CAP_HEAD_DIAMETER];

nut_apothem = screw_array[NUT_WIDTH] / 2;
nut_diameter = screw_array[NUT_WIDTH] / cos(30);
lock_nut_height = screw_array[LOCK_NUT_HEIGHT];
nut_height = screw_array[NUT_HEIGHT];

washer_diameter = screw_array[WASHER_OD];
washer_thick = screw_array[WASHER_HEIGHT];

lead_nut_apothem = lead_screw_array[NUT_WIDTH] / 2;
lead_nut_diameter = lead_screw_array[NUT_WIDTH] / cos(30);
lead_nut_height = lead_screw_array[NUT_HEIGHT];
lead_screw_diameter = lead_screw_array[DIAMETER];
lead_screw_length = 0;

motor_width = motor_array[WIDTH];
motor_length = motor_array[LENGTH];
motor_hole_spacing = motor_array[HOLE_SPACING];
motor_hole_diameter = motor_array[HOLE_DIAMETER];
motor_flange_diameter = motor_array[FLANGE_DIAMETER];
motor_flange_height = motor_array[FLANGE_HEIGHT];
motor_shaft_length = motor_array[SHAFT_LENGTH];
motor_shaft_diameter = motor_array[SHAFT_DIAMETER];
motor_hole_engagement = motor_hole_diameter *1.5;
motor_total_length = motor_length + motor_shaft_length + motor_flange_height;

e0motor_width = e0motor_array[WIDTH];
e0motor_length = e0motor_array[LENGTH];
e0motor_hole_spacing = e0motor_array[HOLE_SPACING];
e0motor_hole_diameter = e0motor_array[HOLE_DIAMETER];
e0motor_flange_diameter = e0motor_array[FLANGE_DIAMETER];
e0motor_flange_height = e0motor_array[FLANGE HEIGHT];
e0motor_shaft_length = e0motor_array[SHAFT_LENGTH];
e0motor_shaft_diameter = e0motor_array[SHAFT_DIAMETER];
e0motor_hole_engagement = e0motor_hole_diameter *1.5;
e0motor_total_length = e0motor_length + e0motor_shaft_length + e0motor_flange_height;

electronics_holes = electronics_array;
electronics_thick = screw_head_height * phi;

coupler_height = motor_shaft_length * 1.5;
coupler_diameter = (motor_shaft_diameter > lead_screw_diameter) ? motor_shaft_diameter * 3 : lead_screw_diameter * 3;

sarrus_top_id = motor_width * sqrt(2) + 2;
sarrus_top_od = sarrus_top_id + 2 + nut_diameter*2.5;
//sarrus_top_thick = lead_nut_height + nut_height + washer_thick + screw_head_height;


sarrus_bottom_thick = screw_diameter * 3;

bottom_truss_interface_height = sarrus_bottom_thick + nut_diameter*2;
bottom_truss_interface_length = -motor_flange_diameter/2 + motor_width/2;
bottom_truss_interface_width = motor_hole_spacing - washer_diameter;

sarrus_link_diameter = screw_diameter * 3;
sarrus_link_length = (build_height + motor_shaft_length + motor_flange_height + coupler_height/2)/2;
sarrus_link_thick = screw_diameter * phi;

sarrus_top_thick = sarrus_link_diameter/2*sqrt(2)+ sarrus_link_diameter/2;
 
truss_length = motor_flange_height+motor_shaft_length+build_height+coupler_height/2+sarrus_top_thick+build_bed_thick+motor_length;
truss_width = motor_width;
truss_height = motor_width * sqrt(2)/2 - motor_width/2;
truss_radius = motor_width * sqrt(2)/2;

truss_top_thick = screw_diameter * 3;

sarrus_nut_trap = lead_nut_apothem*phi*2;

sweep_link_length = build_radius/2;
sweep_link_thick = screw_diameter * 3;

arc_link_length = build_radius/2;
arc_link_thick = screw_diameter * 3;

head_id = build_radius/4;
head_od = head_id + screw_diameter * 5;

foot_thick = lock_nut_height;
foot_width = washer_diameter+nut_apothem * 6;
foot_length = build_radius-motor_width * sqrt(2)/2;
foot_height = motor_length + sarrus_bottom_thick;

extruder_gear_od = extruder_gear_array[0];
extruder_gear_id = extruder_gear_array[1];
extruder_gear_hobb_diameter = extruder_gear_array[2];
extruder_gear_teeth_diameter = extruder_gear_array[3];
extruder_gear_teeth_offset = extruder_gear_array[4];
extruder_gear_height = extruder_gear_array[5];

filament_diameter = 1.8;
plunger_diameter = 9.6;
extruder_thick = plunger_diameter*1.5+motor_flange_height;

insulator_groove_diameter = 12;

//the rotation rate of things during animation
d_sarrus_bottom = -asin((sarrus_link_length-build_height/2*$t)/sarrus_link_length);
d_sarrus_top = -90+asin((sarrus_link_length-build_height/2*$t)/sarrus_link_length);

//Factoids!!
build_volume = pi*(pow(build_radius/10,2) - pow(motor_width/10*sqrt(2),2)) * build_height/10;
echo("Factoids...");
echo(str("--Theoretical build volume =  ",build_volume, " cm^3"));

//Start BOM output
echo("Bill Of Materials (parser coming soon)");
