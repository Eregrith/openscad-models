$fn = 100;

difference() {
    translate([0, 0, 1]) {
        resize([50, 50, 2]) {
            surface(file = "10po_bw_blur.png", center = true, invert = true, convexity = 5);
        }
    }
    difference() {
        cube([60, 60, 20], center = true);
        cylinder(r = 25, h = 21, center = true);
    }
}

difference() {
    translate([0, 0, - 2]) cylinder(r = 27, h = 4);
    cylinder(r = 25, h = 4);
}

translate([0, 29, - 2]) {
    difference() {
        cylinder(r = 4, h = 4);
        cylinder(r = 2, h = 5);
    }
}
