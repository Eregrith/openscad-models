steps_height = 0.5; // [0.05:0.05:10]
steps_number = 20; // [10:1:100]
offset_size = - 0.5; // [-5:0.01:-0.01]
translate([- 42, - 42, 0])
    croix(steps_height, offset_size, steps_number);
module croix(height, off, steps) {
    for (i = [0:steps]) {
        translate([0, 0, height * i]) {
            color([1, (steps - i) / steps, 0]) linear_extrude(height) offset(r = off * i/*^2*/, delta = off * i) import(
            "naheulbeuk-croix.svg");
        }
    }
}
