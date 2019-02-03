
mmpi = 25.4;

height    = 1.00 * mmpi;
top_width = 2.75 * mmpi;
top_depth = 1.25 * mmpi;

bottom_width = 3.00 * mmpi;
bottom_depth = 1.50 * mmpi;

hole_size    = 0.25 * mmpi + 1.0;
hole_depth   = 0.75 * mmpi;

tool_height  = 2.50 * mmpi;
tool_clear   = 0.25 * mmpi;
tool_space   = 0.25 * mmpi;

difference() {
    linear_extrude( height = height, scale=0.8 )
        minkowski() {
            square( size = [ bottom_width, bottom_depth ], center=true );
            circle( r=5 );
        }

    for( i=[ -4.5 * tool_space : tool_space * 2 : 4 * tool_space ] ) {
        for( j=[ -2 * tool_space : tool_space * 3 : 2 * tool_space ] ) {
            translate( [ i, j, tool_clear ] )
            cube( [ hole_size, hole_size, tool_height ] );
        }
    }
}