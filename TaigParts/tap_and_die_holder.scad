mmpi = 25.4;

height    = 1.00 * mmpi;
top_width = 3.00 * mmpi;
top_depth = 2.50 * mmpi;

bottom_width = 3.25 * mmpi;
bottom_depth = 3.00 * mmpi;

difference() {
linear_extrude( height=height, scale=0.8 )
        minkowski() {
            square( size = [ bottom_width, bottom_depth ], center=true );
            circle( r=5 );
        }
        

die_center_x = -15;
die_center_y = -20;
for ( i = [ 0 : 2 ] ) {
    translate( [ 0+i*18+die_center_x, die_center_y, 26 ] ) {
        rotate( [ 0, 16.5, 0 ] )
            Hexagone( 16, 6 );
    }
}

for ( i = [ 0 : 1 ] ) {
    translate( [ 9+i*18+die_center_x, die_center_y+15, 26 ] ) {
        rotate( [ 0, 16.5, 0 ] )
            Hexagone( 16, 6 );
    }
}


tap_center_x = -15;
tap_center_y =  12;
for ( i = [ 0 : 1 ] ) {
    translate( [ 9+i*18+tap_center_x, tap_center_y, 5 ] ) {
        cylinder( r=(4+i)/2, 100 );
    }
}

for ( i = [ 0 : 2 ] ) {
    translate( [ 0+i*18+tap_center_x, tap_center_y+15, 5 ] ) {
        cylinder( r=(6+i)/2, 100 );
    }
}

translate( [ -25, -4, 5 ] )
    cylinder( r=8, 40 );

translate( [ -25, 12, 5 ] )
    cylinder( r=7.0/2, 40 );
}

// from thing:277727
module Hexagone(cle,h)
{
	angle = 360/6;		// 6 pans
	cote = cle * cot(angle);
	echo(angle, cot(angle), cote);
	echo(acos(.6));

	union()
	{
		rotate([0,0,0])
			cube([cle,cote,h],center=true);
		rotate([0,0,angle])
			cube([cle,cote,h],center=true);
		rotate([0,0,2*angle])
			cube([cle,cote,h],center=true);
	}
}

function cot(x)=1/tan(x);