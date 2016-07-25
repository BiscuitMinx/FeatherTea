/// ctb_add_sound( sound_name, sound_value );
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
    
    Add a new sound to the texbox sound database.
    A sound can be used in text like the following example:
    ctb_add_text( myTextbox, "CTB also supports [sound:beep]Sounds!" );
    
    As you can see, the [sound:<sound_name>] syntax is used.
    You can use any sound as long as you've defined them.
    
    Example:
        ctb_add_sound( "beep", snd_beep );
        ctb_add_text( myTextbox, "Some text sometimes need [sound:beep]sounds to gain attention!" );
        
    The above defines a sound, then add some text which will trigger it.
    
    NOTE:
        If you add a sound which name already exists, the old sound will be overwritten
        with the one you are adding.
        
    ATTENTION:
        The sound database is present for use with the sound command.
        Make sure you import the ctb_cmd_sound to be able to use this script!
*/
CTB_Sounds[? argument[0]] = argument[1];
