/// ctb_add_font( font_name, font_value );
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
    
    Add a new font to the texbox font database.
    A font can be used in text like the following example:
    ctb_add_text( myTextbox, "CTB also supports [f:arial]Fonts![f:tahoma]!" );
    
    As you can see, the [f:<font_name>] syntax is used.
    You can use any font as long as you've defined them.
    
    Example:
        ctb_add_font( "tahoma", fnt_tahoma );
        ctb_add_font( "tahomaBI", fnt_tahoma_bold_italic );
        ctb_add_text( myTextbox, "Some text sometimes need [f:tahomaBI]to be emphased[f:tahoma] to gain attention!" );
        
    The above defines 2 fonts, then add some text using both of them.
    
    NOTE:
        If you add a font which name already exists, the old font will be overwritten
        with the one you are adding.
*/
CTB_Fonts[? argument[0]] = argument[1];
