/// ctb_add_command( cmd_name, cmd_script )
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
    
    Add a new command to the texbox commands database.
    A command can be used in text like the following example:
    ctb_add_text( myTextbox, "CTB also supports [speed:1]Commands[speed:3]!" );
    
    This will show the text normally, but the word 'Commands' will show slowly.
    The speed command, like a couple others, are provided with the engine.
    Check how they work to create your own commands!
    
    As you can see, the [<command_name>:<command_argument>] syntax is used.
    You can use any command name as long as you've defined them.
    
    A command is paired with a script, which will receive the argument and be called
    at the exact moment it is matched in the text.
    
    Example:
        ctb_add_command( "speed", ctb_cmd_speed );
        ctb_add_command( "sound", ctb_cmd_sound );
        ctb_add_text( "Let's play a [sound:beep][speed:1]sound[speed:3] inside the message!" );
        
    The above defines 2 commands ( provided with the engine ),
    then add some text using both commands.
    
    The effect will be that the message will slow down for the word 'sound' and it will play
    the 'beep' sound right before displaying the word sound.
    
    NOTE:
        If you add a command which name already exists, the old command will be overwritten
        with the one you are adding.
*/
CTB_Commands[? argument[0]] = argument[1];
