/// ctb_load_normal( sprite, width, height )
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
    
    Generates a sprite by stretching it to provided dimensions.
    The original sprite is not mofified, a modified copy is instead
    returned. ( don't forget to call sprite_free )
    
    Example:
        var textbox_sprite = ctb_load_normal( spr_textbox, room_width-32, 196 );
        sprite_free( textbox_sprite );
        
    The above exmaple generates a sprite for the textbox, then frees it.
*/

// Load parameters
var S,W,H;
S = argument[0];
W = argument[1];
H = argument[2];

// Draw the sprite on a surface
var SU = surface_create( W,H );
surface_set_target( SU );

    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_clear_alpha( c_black,0 );
    draw_sprite_stretched( S,0,0,0,W,H );
    
surface_reset_target();

// Create a sprite from the surface
var SS = sprite_create_from_surface( SU,0,0,W,H,false,false,0,0 );
surface_free( SU );

// Return this new sprite
return SS;
