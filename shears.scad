use <deps.link/BOSL/joiners.scad>

$fn=50;

HANDLE_SIZE_X = 150;
HANDLE_SIZE_Y = 40;
HANDLE_SIZE_Z = 20;
HANDLE_THICKNESS = 4;

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
}

handle();

joiner();