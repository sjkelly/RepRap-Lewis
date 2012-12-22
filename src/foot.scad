include <relations.scad>
include <../../Magpie/magpie.scad>
use <./extensions/extruder.scad>
use <./extensions/electronics_mount.scad>

module foot()
{
  difference()
  {
    union()
    {
      translate([foot_length/4-nut_apothem*2,0,0])cube([foot_length*3/4-foot_width/2+nut_apothem*2,foot_width,foot_thick]);
      translate([foot_length/4-nut_apothem*2,0,0])cube([foot_length*3/4+nut_apothem*2,foot_width/2,foot_thick]);
      translate([foot_length-foot_width/2,foot_width/2,0])cylinder(r=foot_width/2, h  = foot_thick);
      translate([0,0,foot_length/4-nut_apothem*2])cube([foot_thick,foot_width,foot_height-foot_length/4+nut_apothem*2]);
      foot_rounder();
      hull()
      {
        translate([foot_length*3/4,foot_width/2,0])rotate([0,0,30])cylinder(r=nut_diameter, h=foot_thick*2, $fn=6);
        translate([foot_length*3/4,nut_diameter,0])rotate([0,0,30])cylinder(r=nut_diameter, h=foot_thick, $fn=6);
      }
      hull()
      {
        translate([foot_length/4,foot_width/2,0])rotate([0,0,30])cylinder(r=nut_diameter, h=foot_thick*2, $fn=6);
        translate([foot_length/4,nut_diameter,0])rotate([0,0,30])cylinder(r=nut_diameter, h=foot_thick, $fn=6);
      }

    }
    translate([-eta,foot_width/2+washer_diameter/2+nut_apothem,motor_length+sarrus_bottom_thick/2])rotate([0,90,0])poly_cylinder(r=screw_diameter/2, h = foot_thick + eta*2);
    translate([-eta,foot_width/2-washer_diameter/2-nut_apothem,motor_length+sarrus_bottom_thick/2])rotate([0,90,0])poly_cylinder(r=screw_diameter/2, h = foot_thick + eta*2);
    translate([foot_length/4,foot_width/2,-eta])poly_cylinder(r=screw_diameter/2, h = foot_thick + screw_head_diameter + eta*2);
    translate([foot_length*3/4,foot_width/2,-eta])poly_cylinder(r=screw_diameter/2, h = foot_thick + screw_head_diameter + eta*2);
    translate([foot_length/4,foot_width/2,-eta])rotate([0,0,30])cylinder(r=nut_diameter/2, h=foot_thick+eta, $fn=6);
    translate([foot_length*3/4,foot_width/2,-eta])rotate([0,0,30])cylinder(r=nut_diameter/2, h=foot_thick+eta, $fn=6);
  }
}

module extruder_foot()
{
  difference()
  {
    union()
    {
      cube([foot_thick,foot_width,foot_height]);
      hull()
      {
        cube([foot_thick,foot_width,foot_height/2]);
        translate([e0motor_width/2/sin(45),e0motor_width/2/sin(45),0])rotate([0,0,-45])translate([extruder_thick,-e0motor_width/4,0])cube([e0motor_length-eta,e0motor_width/2,cos(30)*e0motor_width/2]);
      }
      translate([0,0,foot_height-foot_length/8-nut_apothem-sarrus_bottom_thick])foot_rounder();


    }
    translate([-eta,foot_width/2+washer_diameter/2+nut_apothem,motor_length+sarrus_bottom_thick/2])rotate([0,90,0])poly_cylinder(r=screw_diameter/2, h = foot_thick + eta*2);
    translate([-eta,foot_width/2-washer_diameter/2-nut_apothem,motor_length+sarrus_bottom_thick/2])rotate([0,90,0])poly_cylinder(r=screw_diameter/2, h = foot_thick + eta*2);
    translate([e0motor_width/2/sin(45),e0motor_width/2/sin(45),foot_thick])rotate([60,0,-45])translate([extruder_thick,0,0])cube([e0motor_length,e0motor_width,e0motor_width]);
    translate([e0motor_width/2/sin(45),e0motor_width/2/sin(45),foot_thick])rotate([-90,30,45])translate([-e0motor_width/2,-e0motor_width/2,-e0motor_length-extruder_thick])translate([e0motor_hole_spacing/2,e0motor_hole_spacing/2,e0motor_length-eta])poly_cylinder(r=screw_diameter/2, h= extruder_thick);
    translate([e0motor_width/2/sin(45),e0motor_width/2/sin(45),foot_thick])rotate([-90,30,45])translate([-e0motor_width/2,-e0motor_width/2,-e0motor_length-extruder_thick])translate([e0motor_hole_spacing/2,e0motor_hole_spacing/2,e0motor_length+extruder_thick/2])poly_cylinder(r=washer_diameter/2, h= extruder_thick);

  }
}

module extruder_foot_assembly()
{
  extruder_foot();
  translate([e0motor_width/2/sin(45),e0motor_width/2/sin(45),foot_thick])rotate([-90,30,45])translate([-e0motor_width/2,-e0motor_width/2,-e0motor_length-extruder_thick])extruder_assembly();
  translate([e0motor_width/2/sin(45),e0motor_width/2/sin(45),foot_thick])rotate([-90,30,45])translate([-e0motor_width/2,-e0motor_width/2,-e0motor_length-extruder_thick])translate([e0motor_hole_spacing/2,e0motor_hole_spacing/2,e0motor_length+extruder_thick/2+washer_thick])rotate([0,180,0])cap_screw(screw,extruder_thick/2+washer_thick+e0motor_hole_engagement);
  translate([e0motor_width/2/sin(45),e0motor_width/2/sin(45),foot_thick])rotate([-90,30,45])translate([-e0motor_width/2,-e0motor_width/2,-e0motor_length-extruder_thick])translate([e0motor_hole_spacing/2,e0motor_hole_spacing/2,e0motor_length+extruder_thick/2])flat_washer(screw);

}

module foot_assembly()
{
  union()
  {
    rotate([0,0,135])translate([motor_width*sqrt(2)/2,-foot_width/2,0])extruder_foot_assembly();
    rotate([0,0,45])translate([motor_width*sqrt(2)/2,-foot_width/2,0])foot();
    rotate([0,0,225])translate([motor_width*sqrt(2)/2,-foot_width/2,0])foot();
    rotate([0,0,315])translate([motor_width*sqrt(2)/2,-foot_width/2,0])foot();
    rotate([0,0,-45])translate([0,-motor_width*sqrt(2)/2-foot_length/4,foot_thick*2])electronics_assembly();
    for(i = [0:90:360])
      {
        rotate([0,0,45+i])translate([motor_width*sqrt(2)/2+foot_thick+washer_thick,washer_diameter/2+nut_apothem,motor_length+sarrus_bottom_thick/2])rotate([0,-90,0])cap_screw(screw,foot_thick+motor_width*sqrt(2)/2-motor_hole_spacing*sqrt(2)/2);
        rotate([0,0,45+i])translate([motor_width*sqrt(2)/2+foot_thick+washer_thick,-washer_diameter/2-nut_apothem,motor_length+sarrus_bottom_thick/2])rotate([0,-90,0])cap_screw(screw,foot_thick+motor_width*sqrt(2)/2-motor_hole_spacing*sqrt(2)/2);
        rotate([0,0,45+i])translate([motor_width*sqrt(2)/2+foot_thick+washer_thick,washer_diameter/2+nut_apothem,motor_length+sarrus_bottom_thick/2])rotate([0,-90,0])flat_washer(screw);
        rotate([0,0,45+i])translate([motor_width*sqrt(2)/2+foot_thick+washer_thick,-washer_diameter/2-nut_apothem,motor_length+sarrus_bottom_thick/2])rotate([0,-90,0])flat_washer(screw);
      }

  }
}

module foot_rounder()
{
  difference()
  {
    translate([foot_length/4-nut_apothem*2,0,foot_length/4-nut_apothem*2])rotate([-90,0,0])cylinder(r=foot_length/4-nut_apothem*2, h=foot_width);
    translate([foot_length/4-nut_apothem*2,-eta,foot_length/4-nut_apothem*2])rotate([-90,0,0])cylinder(r=foot_length/4-nut_apothem*2-foot_thick, h=foot_width+eta*2);
    translate([foot_length/4-nut_apothem*2,-eta,-eta])cube([foot_length/4-nut_apothem*2+eta,foot_width+eta*2,foot_length/2-nut_apothem*4+eta*2]);
    translate([-eta,-eta,foot_length/4-nut_apothem*2])cube([foot_length/4-nut_apothem*2+eta*2,foot_width+eta*2,foot_length/4-nut_apothem*2+eta]);
  }


}

foot_assembly();
//extruder_foot_assembly();
