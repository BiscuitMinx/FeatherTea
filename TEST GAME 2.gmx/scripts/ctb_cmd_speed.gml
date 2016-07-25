/*
    CTB COMMAND: speed
    
    This command requires a number, which represent
    the number of character to display per steps.
    Default is 1.
    
    This affects the speed of the textbox message.
    
    If the argument is invalid, the command is ignored.
*/
var SPD_S = argument[0];
var SPD_D = string_digits( SPD_S );
if( SPD_D == "" ) exit;
else {
    text_speed = real( SPD_S );
    show_debug_message( "Changed text speed to "+string(text_speed) );
    if( text_speed <= 0 ) text_speed = 1;
}
