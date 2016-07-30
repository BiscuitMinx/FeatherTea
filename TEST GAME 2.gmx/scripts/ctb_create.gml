/// ctb_create
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
    
    This is one of the 3 magic scripts of CTB.
    All necessary variables are created here.
    This script should normally be called from the
    create event of your textbox object.
*/

/*
    CTB uses the sprite as the 'zone of text'.
    You can defined the 'distance from the border' where
    the text should be contained, using the padding.
    
    Check my not-so-good graphic below to understand:
    
    +-------------------------+  -+-
    |                         |  -+-  padding_top
    |     some text           |  
    |                         |  -+-
    +-------------------------+  -+-  padding_bottom
    
    |----|         |----------|
  padding_left        padding_right
  
    
    the somewhat rectangle is your textbox's sprite.
    Inside, of course, you have your text.
    The padding is the actuall distance between the border
    of the sprite and where the text starts/ends.
    
    For example, if you want to draw the face of a character on the
    left part of the textbox, then you would put a big padding_left value
    so the text leaves a lot of space for the image :)
*/
padding_left = 8;
padding_right = 8;
padding_top = 8;
padding_bottom = 8;

shown = false;                      // Is the textbox visible on screen?
pause = false;                      // Is the textbox paused?
pause_timer =-1;                    // The timer used to unpause the textbox
messages = ds_queue_create();       // All the messages, in order
current_message = noone;            // The current message to show
current_word = 0;                   // The current word we are at ( used for tag system )
current_pos = 1;                    // The current position in the word we are at
text_speed = 1;                     // The number of character per steps ( default 1 )
line_sep = 0;                       // Distance between 2 lines
tag_on = true;                      // Used in parsing to activate and deactivate tags.

is_typing = false;                  // Is the textbox currently displaying characters one-by-one?
is_finished = false;                // Is the textbox waiting for user input?
end_x = 0;                          // The x position after the last character.
ebd_y = 0;                          // The y position after the last character.

icon_typing = noone;
icon_finished = noone;
icon_frame = 0;
icon_speed = 1;
icon_last = current_time;
