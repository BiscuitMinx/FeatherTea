/// ctb_parse_text( text )
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
    
    This script parses some text for the supported tags.
    Example tags are color tags and font tags.
    
    If a tag is invalid, the tag will be displayed in the output text.
*/

// Step 1: Calculate text area
var TW,TH;
TW = sprite_width - padding_left - padding_right;
TH = sprite_height - padding_top - padding_bottom;

// Make sure area is valid
if( TW<1 || TH<1 ) {
    show_debug_message( "WARNING: Textbox has invalid dimensions!" );
    exit;
}

// Get all the words and all the tags in the message
var W = _ctb_build_word_list( argument[0] );

// Calculate position for each word
_ctb_word_to_message( TW, TH, W );
ds_list_destroy( W );
