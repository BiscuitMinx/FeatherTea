/// ctb_draw()
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
    
    This script will draw the textbox at the current x,y position.
    Simply call this script in the draw event of your textbox object.
*/
draw_self();

if( current_message != noone ) {

    var i,me;
    for( i=0; i<current_word; i++ ){
        me = current_message[| i];
        if( me[0] == "word" ) {
            draw_set_color( me[3] );
            draw_set_font( me[4] );
            draw_text( x+padding_left+me[1], y+padding_top+me[2], me[5] );
        }
    }
    if( !pause ) {
        if( current_word < ds_list_size( current_message ) ) {
            me = current_message[| current_word];
            if( me[0] == "word" ) {
                draw_set_color( me[3] );
                draw_set_font( me[4] );
                draw_text( x+padding_left+me[1], y+padding_top+me[2], string_copy( me[5], 1, floor( current_pos ) ) );
            }
        }
    }
    
    if( current_word < ds_list_size( current_message )-1 ) {
        if( icon_typing != noone ) {
            draw_sprite( icon_typing, icon_frame, x+sprite_width-sprite_get_width( icon_typing )-padding_right, y+sprite_height-sprite_get_height( icon_typing )-padding_bottom );
        }
    }    
    else if( current_word == ds_list_size( current_message )-1 ) {
        me = current_message[| current_word];
        if( me[0] == "word" ) {
            if( current_pos < string_length( me[5] ) && icon_typing != noone ) {
                draw_sprite( icon_typing, icon_frame, x+sprite_width-sprite_get_width( icon_typing )-padding_right, y+sprite_height-sprite_get_height( icon_typing )-padding_bottom );
            }
            else if( icon_finished != noone ) {
                draw_sprite( icon_finished, icon_frame, x+sprite_width-sprite_get_width( icon_finished )-padding_right, y+sprite_height-sprite_get_height( icon_finished )-padding_bottom );
            }
        }
    }
    else if( icon_finished != noone ) {
        draw_sprite( icon_finished, icon_frame, x+sprite_width-sprite_get_width( icon_finished )-padding_right, y+sprite_height-sprite_get_height( icon_finished )-padding_bottom );
    }
    
}
