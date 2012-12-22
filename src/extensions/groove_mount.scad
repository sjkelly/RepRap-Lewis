include <../relations.scad>
include <../../../Magpie/magpie.scad>

module groove_mount()
{
  color("khaki")linear_extrude(height=4.67)difference()
  {
    union()
    {
      circle(r=head_od/2);

    }
    translate([-head_od/2,coupler_diameter/2])square([head_od,head_od/2]);
    for(i = [0 : 60 : 360])
      {
        rotate([0,0,i])translate([(head_od+head_id)/4,0,0])
        poly_circle(r=screw_diameter/2);
      }
    circle(r=insulator_groove_diameter/2);
    translate([-insulator_groove_diameter/2,0])square([insulator_groove_diameter,head_od/2]);
  }
}

groove_mount();
