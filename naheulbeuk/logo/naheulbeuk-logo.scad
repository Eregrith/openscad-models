// hauteur
height = 5; // [0:0.5:10]

translate([- 42, - 42, 0]) {
    difference() {
        color("red")
            linear_extrude(height + 1)
                import("naheulbeuk-croix-contour-out.svg");
        translate([0, 0, height + 0.5])
            color("#444444")
                linear_extrude(1)
                    import("naheulbeuk-croix-contour-in.svg");
    }
    translate([0, 0, 0.001])
        color("yellow")
            linear_extrude(height + 2)
                import("naheulbeuk-croix.svg");
}