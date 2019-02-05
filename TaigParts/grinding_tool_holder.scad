mmpi = 25.4;

height    = 1.00 * mmpi;
top_width = 3.00 * mmpi;
top_depth = 2.50 * mmpi;

bottom_width = 3.25 * mmpi;
bottom_depth = 2.75 * mmpi;

hole_depth   = 0.75 * mmpi;

wheel1_h = ((5/8)    ) * mmpi + 2.0;
wheel1_r = ((1/1) / 2) * mmpi;

wheel2_h = ((5/8)    ) * mmpi + 2.0;
wheel2_r = ((9/8) / 2) * mmpi;

wheel3_h = ((13/16)  ) * mmpi + 2.0;
wheel3_r = ((11/8) /2) * mmpi;

arbor_h  = 2   * mmpi ;
arbor_r  = 1/2 * mmpi + 1.0;

nut_h    = ((7/4)    ) * mmpi;
nut_r    = ((9/16) /2) * mmpi + 1.0;

spacing  = 0.125 * mmpi;
depth    = 0.75 * mmpi;

wheelstack = wheel1_h + wheel2_h + wheel3_h + 2 * spacing;

difference() {
    linear_extrude( height=height, scale=0.8 )
        minkowski() {
            square( size = [ bottom_width, bottom_depth ], center=true );
            circle( r=5 );
        }

    translate( [ -21, -16, 0.25 * mmpi ] )
        cylinder( r=arbor_r, h=arbor_h );
    
    translate( [ 19, -19, 0.25 * mmpi ] )
        cylinder( r=nut_r, h=nut_h, $fn=6 );
    
    translate( [ -wheelstack/2, 10, 30 ] )
        rotate( [0,90,0] ) {
            translate( [ 0, wheel3_r - wheel1_r, 0 ] )
                cylinder( r=wheel1_r, h=wheel1_h );
            translate( [ 0, wheel3_r - wheel2_r, wheel1_h + spacing ] )
                cylinder( r=wheel2_r, h=wheel2_h );
            translate( [ 0, 0, wheel1_h + wheel2_h + spacing + spacing ] )
                cylinder( r=wheel3_r, h=wheel3_h );
        }
    }