/// ctb_init();
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
    
    This script initialize the ctb engine.
    Some global variable will be created, which are needed
    for this engines.
    
    Check the comments below to see what is created.
*/

// Create the databases for the engine, and setup the skip key
globalvar CTB_Colors, CTB_Fonts, CTB_Sounds, CTB_Commands, CTB_SkipKey;
CTB_Colors = ds_map_create();
CTB_Fonts = ds_map_create();
CTB_Sounds = ds_map_create();
CTB_Commands = ds_map_create();

CTB_Colors[? "default"] = c_black;
CTB_Fonts[? "default"] = noone;

CTB_Commands[? "speed"] = ctb_cmd_speed;
CTB_Commands[? "sound"] = ctb_cmd_sound;
CTB_Commands[? "pause"] = ctb_cmd_pause;

CTB_SkipKey = vk_space;
