/// ctb_load_subimage( sprite, width, height )
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
    
    Generates a sprite using slice9 technique, where slices
    are already prepared ( the subimages ).
    The original sprite is not modified, instead a modified
    copy is returned. ( don't forget to call sprite_free() )
    
    Example:
        var textbox_sprite = ctb_load_subimage( spr_texbox_slice9_subimages, room_width-32, 196 );
        sprite_free( textbox_sprite );
        
    The above example creates a textbox sprite based on the slice9 algorithm, whereas the slices
    are already decomposed as the subimages.
    The sprite is then freed.
*/

// Load parameters and calculate other values
var i,j,S,W,H,CW,CH;
S = argument[0];
W = argument[1];
H = argument[2];
CW = sprite_get_width( S );
CH = sprite_get_height( S );

// Draw the sprite on a surface
var SU = surface_create( W,H );
surface_set_target( SU );

    draw_set_alpha( 1 );
    draw_set_color( c_white );
    draw_clear_alpha( c_black,0 );
    draw_set_blend_mode_ext( bm_one,bm_zero );
    
    draw_sprite( S,0,0,0 );                                 // Top left
    for( i=0; i<W-CW; i+=CW ) draw_sprite( S,1,CW+i,0 );    // Top
    draw_sprite( S,2,W-CW,0 );                              // Top Right
    for( i=0; i<H-CH; i+=CH ) draw_sprite( S,3,0,CH+i );    // Left
    for( i=0; i<W-CW; i+=CW ) {
        for( j=0; j<H-CH; j+=CH ) {
            draw_sprite( S,4,CW+i,CH+j );                   // Center
        }
    }
    for( i=0; i<H-CH; i+=CH ) draw_sprite( S,5,W-CW,CH+i ); // Right
    draw_sprite( S,6,0,H-CH );                              // Bottom left
    for( i=0; i<W-CW; i+=CW ) draw_sprite( S,7,CW+i,H-CH ); // Bottom
    draw_sprite( S,8,W-CW,H-CH );                           // Bottom right
    
    draw_set_blend_mode( bm_normal );
    
surface_reset_target();

// Create a sprite from the surface
var SS = sprite_create_from_surface( SU,0,0,W,H,false,false,0,0 );
surface_free( SU );

// Return this new sprite
return SS;
