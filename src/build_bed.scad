include <relations.scad>
include <./Magpie/magpie.scad>
use <sarrus_link.scad>

module build_bed()
{
  difference()
  {
    union()
    {
      circle(r = build_radius);
    }
    circle(r = sarrus_top_id/2);
    for(i = [0 : 45 : 360])
      {
        rotate([0,0,i])translate([(sarrus_top_od+sarrus_top_id)/4,0,-1])poly_circle(r=screw_diameter/2, h = sarrus_top_thick +2);
      }
  }
}

module build_bed_assembly()
{
  color("khaki")translate([0,0,build_bed_thick/2])linear_extrude(height = build_bed_thick, center = true, convexity = 10)build_bed();
  for(i = [0 : 45 : 360])
    {
      rotate([0,0,i])translate([(sarrus_top_od+sarrus_top_id)/4,0,build_bed_thick+washer_thick])rotate([180,0,0])cap_screw(screw,build_bed_thick+washer_thick+sarrus_top_thick);
      rotate([0,0,i])translate([(sarrus_top_od+sarrus_top_id)/4,0,build_bed_thick])flat_washer(screw);
      rotate([0,0,i])translate([(sarrus_top_od+sarrus_top_id)/4,0,-sarrus_top_thick+lock_nut_height])rotate([180,0,30])lock_nut(screw);

    }
}
build_bed();
