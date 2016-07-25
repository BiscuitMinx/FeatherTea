/// ctb_add_text( [ textbox_id ], text );
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
    
    This script adds text to a textbox to display.
    If the textbox_id isn't present, then the current object
    will be used as the textbox.
    
    ctb_add_text( "Message" );      will add the message inside the calling object.
    ctb_add_text( obj, "Message" ); will add the message inside 'obj'.
*/
var TB,TEXT;
if( argument_count == 1 ){
    TB = id;
    TEXT = argument[0];
}
else {
    TB = argument[0];
    TEXT = argument[1];
}

with( TB ) ctb_parse_text( TEXT );
