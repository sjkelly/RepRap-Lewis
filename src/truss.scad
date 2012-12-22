include <relations.scad>
include <../../Magpie/magpie.scad>

module truss()
{
  difference()
  {
    union()
    {
      intersection()
      {
        cube([truss_length, truss_width, truss_height]);
        translate([-eta,truss_width/2,-truss_radius+truss_height])rotate([0,90,0])cylinder(r = truss_radius, h = truss_length + eta *2);
      }
    }
    translate([nut_diameter,truss_width/2+washer_diameter/2,truss_height*3/4])poly_cylinder(r=washer_diameter/2, h= truss_height/2);
    translate([nut_diameter,truss_width/2-washer_diameter/2,truss_height*3/4])poly_cylinder(r=washer_diameter/2, h= truss_height/2);
    translate([nut_diameter,truss_width/2+washer_diameter/2,-eta])poly_cylinder(r=screw_diameter/2, h= truss_height+eta*2);
    translate([nut_diameter,truss_width/2-washer_diameter/2,-eta])poly_cylinder(r=screw_diameter/2, h= truss_height+eta*2);

    translate([truss_length-motor_length-truss_top_thick/2,truss_width/2+motor_hole_spacing/2-screw_diameter,truss_height*2/3])poly_cylinder(r=washer_diameter/2, h= truss_height/2);
    translate([truss_length-motor_length-truss_top_thick/2,truss_width/2-motor_hole_spacing/2+screw_diameter,truss_height*2/3])poly_cylinder(r=washer_diameter/2, h= truss_height/2);
    translate([truss_length-motor_length-truss_top_thick/2,truss_width/2+motor_hole_spacing/2-screw_diameter,-eta])poly_cylinder(r=screw_diameter/2, h= truss_height+eta*2);
    translate([truss_length-motor_length-truss_top_thick/2,truss_width/2-motor_hole_spacing/2+screw_diameter,-eta])poly_cylinder(r=screw_diameter/2, h= truss_height+eta*2);


  }
}
module truss_assembly()
{
  union()
  {
    truss();
    translate([nut_diameter,truss_width/2+washer_diameter/2,truss_height*3/4])flat_washer(screw);
    translate([nut_diameter,truss_width/2-washer_diameter/2,truss_height*3/4])flat_washer(screw);
    translate([nut_diameter,truss_width/2+washer_diameter/2,truss_height*3/4+washer_thick])rotate([180,0,0])cap_screw(screw,truss_height*3/4+bottom_truss_interface_length+lock_nut_height-nut_height+washer_thick);
    translate([nut_diameter,truss_width/2-washer_diameter/2,truss_height*3/4+washer_thick])rotate([180,0,0])cap_screw(screw,truss_height*3/4+bottom_truss_interface_length+lock_nut_height-nut_height+washer_thick);

    translate([truss_length-motor_length-truss_top_thick/2,truss_width/2+motor_hole_spacing/2-screw_diameter,truss_height*2/3])flat_washer(screw);
    translate([truss_length-motor_length-truss_top_thick/2,truss_width/2-motor_hole_spacing/2+screw_diameter,truss_height*2/3])flat_washer(screw);
    translate([truss_length-motor_length-truss_top_thick/2,truss_width/2+motor_hole_spacing/2-screw_diameter,truss_height*2/3+washer_thick])rotate([180,0,0])cap_screw(screw,truss_height*2/3+washer_thick+motor_width/2-motor_hole_spacing/2+washer_diameter/2+lock_nut_height);
    translate([truss_length-motor_length-truss_top_thick/2,truss_width/2-motor_hole_spacing/2+screw_diameter,truss_height*2/3+washer_thick])rotate([180,0,0])cap_screw(screw,truss_height*2/3+washer_thick+motor_width/2-motor_hole_spacing/2+washer_diameter/2+lock_nut_height);
  }
}

truss_assembly();
