/*
    CTB COMMAND: sound
    
    This command will play a sound previously registered
    with ctb_add_sound.
    
    If the sound doesn't exists, the command is ignored.
*/
if( ds_map_exists( CTB_Sounds, argument[0] ) ) {
    var SND = CTB_Sounds[? argument[0]];
    if( sound_exists( SND ) ) audio_play_sound( SND,1,false );
}
