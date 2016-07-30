/// ctb_add_color( color_name, color_value );
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
    
    Add a new color to the texbox color database.
    A color can be used in text like the following example:
    ctb_add_text( myTextbox, "CTB also supports [c:blue]Colors[c:white]!" );
    
    As you can see, the [c:<color_name>] syntax is used.
    You can use any color as long as you've defined them.
    
    Example:
        ctb_add_color( "white", c_white );
        ctb_add_color( "blue", c_blue );
        ctb_add_color( "lightblue", make_colour_rgb( 170,170,255 ) );
        ctb_add_text( myTextbox, "Some [c:blue]colors[c:white] makes [c:lightblue]life[c:white] easier!" );
        
    The above defines 3 colors, then add some text using all those 3 colors.
    
    NOTE:
        If you add a color which name already exists, the old color will be overwritten
        with the one you are adding.
*/
CTB_Colors[? argument[0]] = argument[1];
