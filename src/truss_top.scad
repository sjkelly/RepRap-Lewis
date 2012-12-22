include <relations.scad>
include <../../Magpie/magpie.scad>

module truss_top()
{
  difference()
  {
    union()
    {
      translate([0,0,truss_top_thick/2])cube([motor_width,motor_width,truss_top_thick],center=true);
    }
    translate([motor_hole_spacing/2,motor_hole_spacing/2,-1])poly_cylinder(r=motor_hole_diameter/2, h = truss_top_thick+2);
    translate([-motor_hole_spacing/2,motor_hole_spacing/2,-1])poly_cylinder(r=motor_hole_diameter/2, h = truss_top_thick+2);
    translate([motor_hole_spacing/2,-motor_hole_spacing/2,-1])poly_cylinder(r=motor_hole_diameter/2, h = truss_top_thick+2);
    translate([-motor_hole_spacing/2,-motor_hole_spacing/2,-1])poly_cylinder(r=motor_hole_diameter/2, h = truss_top_thick+2);
    translate([0,0,-1])poly_cylinder(r=lead_screw_diameter/2, h = sarrus_bottom_thick+2);
    translate([0,motor_hole_spacing/2-screw_diameter,truss_top_thick/2])rotate([0,90,0])poly_cylinder(r=screw_diameter/2, h=motor_width+eta*2,center=true);
    translate([0,-motor_hole_spacing/2+screw_diameter,truss_top_thick/2])rotate([0,90,0])poly_cylinder(r=screw_diameter/2, h=motor_width+eta*2,center=true);

    translate([motor_hole_spacing/2-washer_diameter/2-lock_nut_height,motor_hole_spacing/2-screw_diameter-nut_apothem,-eta])cube([lock_nut_height,nut_apothem*2,truss_top_thick+eta*2]);
    translate([motor_hole_spacing/2-washer_diameter/2-lock_nut_height,-motor_hole_spacing/2+screw_diameter-nut_apothem,-eta])cube([lock_nut_height,nut_apothem*2,truss_top_thick+eta*2]);
    translate([-motor_hole_spacing/2+washer_diameter/2,motor_hole_spacing/2-screw_diameter-nut_apothem,-eta])cube([lock_nut_height,nut_apothem*2,truss_top_thick+eta*2]);
    translate([-motor_hole_spacing/2+washer_diameter/2,-motor_hole_spacing/2+screw_diameter-nut_apothem,-eta])cube([lock_nut_height,nut_apothem*2,truss_top_thick+eta*2]);
  }
}
module truss_top_assembly()
{
  translate([0,0,truss_top_thick])union()
  {
    rotate([180,0,0])truss_top();
    stepper(motor);
    translate([motor_hole_spacing/2,motor_hole_spacing/2,-truss_top_thick-washer_thick])flat_washer(screw);
    translate([motor_hole_spacing/2,-motor_hole_spacing/2,-truss_top_thick-washer_thick])flat_washer(screw);
    translate([-motor_hole_spacing/2,motor_hole_spacing/2,-truss_top_thick-washer_thick])flat_washer(screw);
    translate([-motor_hole_spacing/2,-motor_hole_spacing/2,-truss_top_thick-washer_thick])flat_washer(screw);
    translate([motor_hole_spacing/2,motor_hole_spacing/2,-truss_top_thick-washer_thick])cap_screw(screw,screw,truss_top_thick+motor_length);
    translate([motor_hole_spacing/2,-motor_hole_spacing/2,-truss_top_thick-washer_thick])cap_screw(screw,truss_top_thick+motor_length);
    translate([-motor_hole_spacing/2,motor_hole_spacing/2,-truss_top_thick-washer_thick])cap_screw(screw,truss_top_thick+motor_length);
    translate([-motor_hole_spacing/2,-motor_hole_spacing/2,-truss_top_thick-washer_thick])cap_screw(screw,truss_top_thick+motor_length);

    translate([motor_hole_spacing/2-washer_diameter/2,motor_hole_spacing/2-screw_diameter,-truss_top_thick/2])rotate([0,-90,0])lock_nut(screw);
    translate([motor_hole_spacing/2-washer_diameter/2,-motor_hole_spacing/2+screw_diameter,-truss_top_thick/2])rotate([0,-90,0])lock_nut(screw);
    translate([-motor_hole_spacing/2+washer_diameter/2,motor_hole_spacing/2-screw_diameter,-truss_top_thick/2])rotate([0,90,0])lock_nut(screw);
    translate([-motor_hole_spacing/2+washer_diameter/2,-motor_hole_spacing/2+screw_diameter,-truss_top_thick/2])rotate([0,90,0])lock_nut(screw);
  }
}

truss_top_assembly();
