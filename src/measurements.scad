include <configuration.scad>

//Screw Dimension arrays
//[Diameter, Head Height, Head Diameter, nut across flats, lock nut height, nut height, washer od, washer thick]
m2 = [2, 2, 3.8, 4, 2.8, 1.6, 5, 0.3];
m2_5 = [2.5, 2.5, 4.5, 5, 3.8, 2, 6, 0.5];
m3 = [3, 3, 5.5, 5.5, 4, 2.4, 7, 0.6];
m4 = [4, 4, 7, 7, 5, 3.2, 9, 0.9];
m5 = [5, 5, 8.5, 8, 5, 4, 10, 1.1];
m6 = [6, 6, 10, 10, 6, 5, 12.5, 1.8];
m8 = [8, 8, 13, 13, 8, 6.5, 17, 1.8];

//motor dimension arrays
//[width, length, hole spacing, hole diameter, flange diameter, flange height, shaft length, shaft diameter]
nema8 = [20.3, 30, 16, 2, 15, 1.5, 14, 4];
nema11 = [28.1, 27, 23, 2.5, 21, 2, 20, 5];
nema14 = [35.2, 36, 26, 3, 22, 2, 21, 5];
nema17 = [42.3, 48, 31, 3, 22, 2, 23, 5];
pololu_35x26 = [35.2, 26, 26, 3, 22, 2, 21, 5];

//electronics dimension arrays
//[[x,y,z],etc..]
melzi = [[0,0,0],[200,0,0],[0,42,0],[200,42,0]];
mega = [[0,0,0],[80,0,0],[1.3,48.3,0],[76.2,48.3,0]];//second entry needs fixing
printrboard = [[0,0,0],[91,0,0],[0,52.75,0],[91,52.75,0]];
sanguinololu = [[0,0,0],[94,0,0],[0,44,0],[94,44,0]];

//extruder drive gear dimensions arrays
//[outer diameter, inner diameter, hobb diameter, teeth diameter(torus inside to inside), teeth offset(from bottom), height]
arcol8x5 = [8,5,5,6,5,13];
arcol11x5 = [11.1,5,5,9.1,6,13];
arcol11x8 = [11.1,8,5,9.1,6,13];
arcol13x8 = [13.3,8,5,11.3,6,13];

// Assign Screw array
function get_screw_dims(screw) = (screw=="M2") ? m2 : (screw=="M2.5") ? m2_5 : (screw=="M3") ? m3 : (screw=="M4") ? m4 : (screw=="M5") ? m5 : (screw=="M6") ? m6 : (screw=="M8") ? m8 : "error";

screw_array = get_screw_dims(screw);

// Assign Lead Screw Array
lead_screw_array = (lead_screw=="M2") ? m2 : (lead_screw=="M2.5") ? m2_5 : (lead_screw=="M3") ? m3 : (lead_screw=="M4") ? m4 : (lead_screw=="M5") ? m5 : (lead_screw=="M6") ? m6 : (lead_screw=="M8") ? m8 : "error";

//Assign motor array
motor_array = (motor=="NEMA8") ? nema8 : (motor=="NEMA11") ? nema11 : (motor=="NEMA14") ? nema14 : (motor=="NEMA17") ? nema17 : (motor=="Pololu 35x26") ? pololu_35x26 :"error";

//Assign e0 motor array
e0motor_array = (e0motor=="NEMA8") ? nema8 : (e0motor=="NEMA11") ? nema11 : (e0motor=="NEMA14") ? nema14 : (e0motor=="NEMA17") ? nema17 : (e0motor=="Pololu 35x26") ? pololu_35x26 :"error";

//assign electronics
electronics_array = (electronics=="Melzi") ? melzi : (electronics=="Mega") ? mega : (electronics=="Printrboard") ? printrboard : (electronics=="Sanguinololu") ? sanguinololu :"error";

extruder_gear_array = (extruder_gear=="Arcol8x5") ? arcol8x5 : (extruder_gear=="Arcol11x8") ? arcol11x8 : (extruder_gear=="Arcol11x5") ? arcol11x5 : (extruder_gear=="Arcol13x8") ? arcol13x8 : "error";

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


screw_diameter = screw_array[0];
screw_head_height = screw_array[1];
screw_head_diameter = screw_array[2];

nut_apothem = screw_array[3] / 2;
nut_diameter = screw_array[3] / cos(30);
lock_nut_height = screw_array[4];
nut_height = screw_array[5];

washer_diameter = screw_array[6];
washer_thick = screw_array[7];

lead_nut_apothem = lead_screw_array[3] / 2;
lead_nut_diameter = lead_screw_array[3] / cos(30);
lead_nut_height = lead_screw_array[5];
lead_screw_diameter = lead_screw_array[0];
lead_screw_length = 00;

motor_width = motor_array[0];
motor_length = motor_array[1];
motor_hole_spacing = motor_array[2];
motor_hole_diameter = motor_array[3];
motor_flange_diameter = motor_array[4];
motor_flange_height = motor_array[5];
motor_shaft_length = motor_array[6];
motor_shaft_diameter = motor_array[7];
motor_hole_engagement = motor_hole_diameter *1.5;
motor_total_length = motor_length + motor_shaft_length + motor_flange_height;

e0motor_width = e0motor_array[0];
e0motor_length = e0motor_array[1];
e0motor_hole_spacing = e0motor_array[2];
e0motor_hole_diameter = e0motor_array[3];
e0motor_flange_diameter = e0motor_array[4];
e0motor_flange_height = e0motor_array[5];
e0motor_shaft_length = e0motor_array[6];
e0motor_shaft_diameter = e0motor_array[7];
e0motor_hole_engagement = e0motor_hole_diameter *1.5;
e0motor_total_length = e0motor_length + e0motor_shaft_length + e0motor_flange_height;

electronics_holes = electronics_array;
electronics_thick = screw_head_height*phi;

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
foot_width = washer_diameter+nut_apothem*6;
foot_length = build_radius-motor_width*sqrt(2)/2;
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
