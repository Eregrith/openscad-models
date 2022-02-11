function hsv(h, s = 1, v = 1, a = 1, p, q, t) = (p == undef || q == undef || t == undef)
    ? hsv(
        (h % 1) * 6,
        s < 0?0:s > 1?1:s,
        v < 0?0:v > 1?1:v,
    a,
        (v < 0?0:v > 1?1:v) * (1 - (s < 0?0:s > 1?1:s)),
        (v < 0?0:v > 1?1:v) * (1 - (s < 0?0:s > 1?1:s) * ((h % 1) * 6 - floor((h % 1) * 6))),
        (v < 0?0:v > 1?1:v) * (1 - (s < 0?0:s > 1?1:s) * (1 - ((h % 1) * 6 - floor((h % 1) * 6))))
    )
    :
            h < 1 ? [v, t, p, a] :
                    h < 2 ? [q, v, p, a] :
                            h < 3 ? [p, v, t, a] :
                                    h < 4 ? [p, q, v, a] :
                                            h < 5 ? [t, p, v, a] :
                                                    [v, p, q, a];

module colorSphere(r = 100) {
    hInc = .03;
    sInc = .07;
    vInc = .1;
    cubeSize = r / 20;
    for (h = [0:hInc:1 - hInc]) {
        for (s = [0:sInc:1]) {
            for (v = [0:vInc:1]) {
                rotate([((s * .9 + .05) - .5) * 180, h * 360, 0])
                    translate([0, 0, v * r])
                        color(hsv(h, s, v))
                            cube([cubeSize, cubeSize, cubeSize], center = true);
            }
        }
    }
}

module colorCube(size = [100, 100, 100], res = 10) {
    hInc = res / size[0];
    sInc = res / size[1];
    vInc = res / size[2];

    cubeSize = pow((size[0] / res) * (size[1] / res) * (size[2] / res), 1 / 3) / 2;

    translate([- size[0] / 2, - size[1] / 2, - size[2] / 2])
        for (h = [0:hInc:1]) {
            for (s = [0:sInc:1]) {
                for (v = [0:vInc:1]) {
                    translate([h * size[0], s * size[1], v * size[2]]) color(hsv(h, s, v)) cube([cubeSize, cubeSize,
                        cubeSize], center = true);
                }
            }
        }
}

translate([- 150, 0, 0]) colorSphere();
translate([100, 0, 0]) colorCube();