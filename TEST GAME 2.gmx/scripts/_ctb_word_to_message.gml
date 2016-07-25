/// _ctb_word_to_message( text_area_width, text_area_height, words )
/*
    This script calculates the position, color and font of each words,
    wrapping text accordingly.
    
    You should normally have no need to use this script.
*/

var W,TW,TH;
var i,w="";
var px=0,py=0,npy=0;
var Words = ds_list_create();
var current_color = CTB_Colors[? "default"];
var current_font = CTB_Fonts[? "default"];

TW = argument[0];
TH = argument[1];
W = argument[2];

draw_set_color( current_color );
draw_set_font( current_font );

for( i=0; i<ds_list_size( W ); i++ ) {

    w = W[| i];
    if( is_string( w ) ) {
        var ww,wh;
        if( string_pos( "#",w ) != 0 && w!="#" && w!="\#" ) w = string_replace( w,"#","\#" );
        ww = string_width( w );
        wh = string_height( w );
        if( wh > npy ) npy = wh;
                
        if( px+ww < TW && py+wh < TH ) {
            ds_list_add( Words,_ctb_create_word( px,py,current_color,current_font,w ) );
            px += string_width( w );
        }
        else if( py+npy < TH ) {
            px = 0;
            py += npy;
            npy = 0;
            
            ds_list_add( Words,_ctb_create_word( px,py,current_color,current_font,w ) );
            px += string_width( w );
        }
        else {
            ds_queue_enqueue( messages, Words );
            Words = ds_list_create();
            px = 0;
            py = 0;
            npy = 0;
            i--;
        }
    }
    else if( is_array( w ) ) {
        switch( w[0] )
        {
            case "color":
                current_color = w[1];
                draw_set_color( current_color );
            break;
            
            case "font":
                current_font = w[1];
                draw_set_font( current_font );
            break;
            
            case "newline":
                if( py+npy < TH ) {
                    px = 0;
                    py += npy;
                    npy = 0;
                }
                else {
                    ds_queue_enqueue( messages, Words );
                    Words = ds_list_create();
                    px = 0;
                    py = 0;
                    npy = 0;
                }
            break;
            
            default:
                var cmd=0;
                cmd[0] = w[0];
                cmd[1] = w[1];
                ds_list_add( Words, cmd );
            break;
                
        }
    }
}

if( !ds_list_empty( Words ) ) ds_queue_enqueue( messages, Words );
