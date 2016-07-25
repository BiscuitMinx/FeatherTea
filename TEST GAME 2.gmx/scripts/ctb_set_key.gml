/// ctb_set_key( key )
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
    
    This script will set the key to interact with the textbox engine.
    If this key is pressed when a page finished displaying, it will
    go to the next page, or in case of the last page, close the textbox.
    If the key is pressed while the message is still displaying, this will
    instantly end the message and show the 'continue' icon.
    
    ctb_set_key( vk_space ); // Will set the key to space. This is also the default key.
*/
CTB_SkipKey = argument[0];
