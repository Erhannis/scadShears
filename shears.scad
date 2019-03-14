use <deps.link/BOSL/joiners.scad>

$fn=50;

JOINER_SIZE_X = 10;

HANDLE_SIZE_X = 150 - JOINER_SIZE_X;
HANDLE_SIZE_Y = 40;
HANDLE_SIZE_Z = 20;
HANDLE_THICKNESS = 4;

BLADE_SIZE_X = 100;
BLADE_SIZE_Y = HANDLE_SIZE_Y*(0.6);
BLADE_SIZE_Z = 10;

JOINER_SIZE_Y = 10;

module handle() {
  difference() {
    union() {
      translate([HANDLE_SIZE_Y/2,HANDLE_SIZE_Y/2,0])
        cylinder(d=HANDLE_SIZE_Y,h=HANDLE_SIZE_Z);
      translate([HANDLE_SIZE_Y/2,0,0])
        cube([HANDLE_SIZE_X - (HANDLE_SIZE_Y/2), HANDLE_SIZE_Y, HANDLE_SIZE_Z]);
    }
    union() {
      translate([HANDLE_SIZE_Y/2,HANDLE_SIZE_Y/2,0])
        cylinder(d=(HANDLE_SIZE_Y-(2*HANDLE_THICKNESS)),h=HANDLE_SIZE_Z);
      translate([HANDLE_SIZE_Y/2,HANDLE_THICKNESS,0])
        cube([HANDLE_SIZE_X - (HANDLE_SIZE_Y/2), HANDLE_SIZE_Y-(2*HANDLE_THICKNESS), HANDLE_SIZE_Z]);
    }
  }
  
  for (i = [0,1]) {
    translate([JOINER_SIZE_X+HANDLE_SIZE_X, HANDLE_THICKNESS/2+(i*(HANDLE_SIZE_Y-HANDLE_THICKNESS)), HANDLE_SIZE_Z/2])
      rotate([0,0,-90])
        half_joiner(h=HANDLE_SIZE_Z, w=JOINER_SIZE_Y);
  }
}

module blade() {
  JL = 10;
  BLADE_OFFSET_Z = 5;
  difference() {
    translate([-JL,HANDLE_THICKNESS/2,BLADE_OFFSET_Z])
      rotate([0,0,90])
        half_joiner2(h=HANDLE_SIZE_Z, w=JOINER_SIZE_Y, l=JL);
    translate([0,0,-500])
    cube(1000, center=true);
  }
  scale([BLADE_SIZE_X,BLADE_SIZE_Y,BLADE_SIZE_Z]) {
    difference() {
      cube(1);
      translate([1,0,0])
      rotate([0,0,45])
      rotate([0,-atan(sqrt(2)/2),0])
      cube(3);
      translate([1,0,0])
      rotate([0,0,45])
      cube(3);
    }
  }
}

handle();
translate([0,-30,0])
blade();
translate([0,-60,0])
blade();