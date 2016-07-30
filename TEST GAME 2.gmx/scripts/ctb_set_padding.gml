/// ctb_set_padding( left, right, top, bottom )
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
    
    This script will set the padding of the textbox.
    The padding is the distance between the text and the border of the sprite.
    
    A textbox with no padding looks like this:
    
    +------------------------+
    |I have no padding at all|
    +------------------------+
    
    A textbox with some padding will look like so:
    
    +--------------------------+
    |                          |
    |   I have some padding!   |
    |                          |
    +--------------------------+
    
    As you see, padding makes sure the text will stay witin a certain area
    inside your textbox.
    
    TIP:
        If you put a large padding, you could then draw a character sprite above the textbox
        to display who is talking!
        
    +---------------------------------------------+
    | +-------+    Hello my friend!               |
    | | ('.') |    I am a character with a face!  |
    | +-------+    Isn't this awesome?            |
    +---------------------------------------------+
                
*/
padding_left = argument[0];
padding_right = argument[1];
padding_top = argument[2];
padding_bottom = argument[3];
