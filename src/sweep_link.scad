include <relations.scad>
include <./Magpie/magpie.scad>
use <arc_link.scad>

module sweep_link()
{
  difference()
  {
    union()
    {
      translate([sweep_link_length,0,sweep_link_thick/2])cube([motor_width,motor_width,sweep_link_thick],center=true);
      translate([0,-coupler_diameter/2,0])cube([sweep_link_length-motor_width/2,coupler_diameter,motor_shaft_length]);
      cylinder(r = coupler_diameter/2, h = motor_shaft_length);

    }
    translate([0,0,-eta])poly_cylinder(r = motor_shaft_diameter/2, h = motor_shaft_length + eta*2);

        translate([-motor_shaft_diameter/2-nut_height-0.25, -nut_apothem-.25, -eta])cube([nut_height+0.5, nut_apothem*2+0.5, motor_shaft_length+eta*2]);
    translate([0,0,motor_shaft_length/4])rotate([0,-90,0])poly_cylinder(r= screw_diameter/2, h = coupler_diameter/2);
    translate([0,0,motor_shaft_length*3/4])rotate([0,-90,0])poly_cylinder(r= screw_diameter/2, h = coupler_diameter/2);

    translate([sweep_link_length+motor_hole_spacing/2,motor_hole_spacing/2,-1])poly_cylinder(r=motor_hole_diameter/2, h = truss_top_thick+2);
    translate([sweep_link_length-motor_hole_spacing/2,motor_hole_spacing/2,-1])poly_cylinder(r=motor_hole_diameter/2, h = truss_top_thick+2);
    translate([sweep_link_length+motor_hole_spacing/2,-motor_hole_spacing/2,-1])poly_cylinder(r=motor_hole_diameter/2, h = truss_top_thick+2);
    translate([sweep_link_length-motor_hole_spacing/2,-motor_hole_spacing/2,-1])poly_cylinder(r=motor_hole_diameter/2, h = truss_top_thick+2);
    translate([sweep_link_length,0,-1])poly_cylinder(r=motor_flange_diameter/2, h = sarrus_bottom_thick+2);
  }
}
module sweep_link_assembly()
{
  rotate([0,0,360*$t])
  union()
  {
    rotate([0,0,0])sweep_link();
    translate([sweep_link_length,0,-motor_shaft_length-motor_flange_height+sweep_link_thick])rotate([0,0,0])arc_link_assembly();
    translate([-motor_shaft_diameter/2-nut_height, 0, motor_shaft_length/4])rotate([0,90,0])nut(screw);
    translate([-coupler_diameter/2, 0, motor_shaft_length/4])rotate([0,90,0])set_screw(screw,coupler_diameter/2);
    translate([-motor_shaft_diameter/2-nut_height, 0, motor_shaft_length*3/4])rotate([0,90,0])nut(screw);
    translate([-coupler_diameter/2, 0, motor_shaft_length*3/4])rotate([0,90,0])set_screw(screw,coupler_diameter/2);
    translate([sweep_link_length,0,motor_length+sweep_link_thick])rotate([180,0,0])stepper(motor);
    translate([sweep_link_length+motor_hole_spacing/2,motor_hole_spacing/2,-washer_thick])flat_washer(screw);
    translate([sweep_link_length+motor_hole_spacing/2,-motor_hole_spacing/2,-washer_thick])flat_washer(screw);
    translate([sweep_link_length-motor_hole_spacing/2,motor_hole_spacing/2,-washer_thick])flat_washer(screw);
    translate([sweep_link_length-motor_hole_spacing/2,-motor_hole_spacing/2,-washer_thick])flat_washer(screw);
    translate([sweep_link_length+motor_hole_spacing/2,motor_hole_spacing/2,-washer_thick])cap_screw(screw,sweep_link_thick+motor_hole_engagement+washer_thick);
    translate([sweep_link_length+motor_hole_spacing/2,-motor_hole_spacing/2,-washer_thick])cap_screw(screw,sweep_link_thick+motor_hole_engagement+washer_thick);
    translate([sweep_link_length-motor_hole_spacing/2,motor_hole_spacing/2,-washer_thick])cap_screw(screw,sweep_link_thick+motor_hole_engagement+washer_thick);
    translate([sweep_link_length-motor_hole_spacing/2,-motor_hole_spacing/2,-washer_thick])cap_screw(screw,sweep_link_thick+motor_hole_engagement+washer_thick);

  }
}

sweep_link();
