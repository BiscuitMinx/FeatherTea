/*
    CTB COMMAND: pause
    
    This command will pause the textbox for a certain amount of steps.
    If you put a value that is invalid, the command is ignored.
    Also, if there is no more words left after the command,the command
    will also be ignored.
*/
var T_S = argument[0];
var T_D = string_digits( T_S );
if( T_D != "" ) {
    if( current_word+1 < ds_list_size( current_message ) ){
        pause_timer = real( T_S );
        pause = true;
    }
}
