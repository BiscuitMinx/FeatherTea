/// ctb_load_slice9( sprite, left, right, top, bottom, width, height )
/*
    +--------------------------------------------------+
    |               Ced's Textbox                      |
    +--------------------------------------------------+
    | Author: Cedrik Dubois [ CedSharp ]               |
    |                                                  |
    | Description:                                     |
    |   An extension that make use of textbox easier,  |
    |   for any game, fully customizable.              |
    +--------------------------------------------------+
    
    Generates a sprite using slice9 technique, given all 4 delimitation.
    The original sprite is not modified, instead a modified copy is returned.
    ( don't forget to call sprite_free() )
    The sprite will first be decomposed, then drawn on a surface matching width and height.
    This thecnique gives the best result overall, as it can use any dimensions.
    On an other hand, it also use more processing.
    
    Example:
        var textbox_sprite = ctb_load_slice9( spr_textbox_slice9, 16,16,16,16, room_width-32, 196 );
        sprite_free( textbox_sprite );
        
    The above example will decompose a sprite using the slice definition ( 16,16,16,16 ), then
    build a new sprite with the provided dimensions ( room_width-32,196 ).
    Then the sprite is freed.
*/

// Load parameters and calculate other values
var i,j,S,L,R,T,B,W,H,SW,SH,CW,CH;
S = argument[0];
L = argument[1];
R = argument[2];
T = argument[3];
B = argument[4];
W = argument[5];
H = argument[6];
SW = sprite_get_width( S );
SH = sprite_get_height( S );
CW = SW - L - R;
CH = SH - T - B;

// Decompose sprite on multiple surfaces
var sTL,sT,sTR,sL,sC,sR,sBL,sB,sBR;

draw_set_color( c_white );
draw_set_alpha( 1 );
draw_set_blend_mode_ext( bm_one, bm_zero );

sTL = surface_create( L,T ); surface_set_target( sTL ); draw_clear_alpha( c_black,0 ); draw_sprite( S,0,0,0 ); surface_reset_target();         // Top left
sT = surface_create( CW,T ); surface_set_target( sT ); draw_clear_alpha( c_black,0 ); draw_sprite( S,0,-L,0 ); surface_reset_target();         // Top
sTR = surface_create( L,T ); surface_set_target( sTR ); draw_clear_alpha( c_black,0 ); draw_sprite( S,0,-SW+R,0 ); surface_reset_target();     // Top right
sL = surface_create( L,CH ); surface_set_target( sL ); draw_clear_alpha( c_black,0 ); draw_sprite( S,0,0,-T );surface_reset_target();          // Left
sC = surface_create( CW,CH ); surface_set_target( sC ); draw_clear_alpha( c_black,0 ); draw_sprite( S,0,-L,-T ); surface_reset_target();       // Center
sR = surface_create( L,CH ); surface_set_target( sR ); draw_clear_alpha( c_black,0 ); draw_sprite( S,0,-SW+CW,-T ); surface_reset_target();    // Right
sBL = surface_create( L,T ); surface_set_target( sBL ); draw_clear_alpha( c_black,0 ); draw_sprite( S,0,0,-SH+B ); surface_reset_target();     // Top left
sB = surface_create( CW,T ); surface_set_target( sB ); draw_clear_alpha( c_black,0 ); draw_sprite( S,0,-L,-SH+B ); surface_reset_target();     // Top
sBR = surface_create( L,T ); surface_set_target( sBR ); draw_clear_alpha( c_black,0 ); draw_sprite( S,0,-SW+R,-SH+B ); surface_reset_target(); // Top right

// Create a surface and draw all surfaces on it
var SU = surface_create( W,H );
surface_set_target( SU );

    draw_set_alpha( 1 );
    draw_set_color( c_white );
    draw_clear_alpha( c_black,0 );
    draw_set_blend_mode_ext( bm_one,bm_zero );
    
    draw_surface( sTL,0,0 );                                // Top left
    for( i=0; i<W-R; i+=CW ) draw_surface( sT,L+i,0 );      // Top
    draw_surface( sTR,W-R,0 );                              // Top Right
    for( i=0; i<H-B; i+=CH ) draw_surface( sL,0,T+i );      // Left
    for( i=0; i<W-R; i+=CW ) {
        for( j=0; j<H-B; j+=CH ) {
            draw_surface( sC,L+i,T+j );                     // Center
        }
    }
    for( i=0; i<H-B; i+=CH ) draw_surface( sR,W-R,T+i );    // Right
    draw_surface( sBL,0,H-B );                              // Bottom left
    for( i=0; i<W-R; i+=CW ) draw_surface( sB,L+i,H-B );    // Bottom
    draw_surface( sBR,W-R,H-B );                            // Bottom right
    
    draw_set_blend_mode( bm_normal );
    
surface_reset_target();

// Create a sprite from the new surface
var SS = sprite_create_from_surface( SU,0,0,W,H,false,false,0,0 );

// Free all the surfaces
surface_free( sTL );
surface_free( sT );
surface_free( sTR );
surface_free( sL );
surface_free( sC );
surface_free( sR );
surface_free( sBL );
surface_free( sB );
surface_free( sBR );
surface_free( SU );

// Return this new sprite
return SS;
