///scr_get_input
D = keyboard_check(ord('D'));
W = keyboard_check(ord('W'));
A = keyboard_check(ord('A'));
S = keyboard_check(ord('S'));
dash = keyboard_check(ord('C'));
attack_key = keyboard_check(ord('E'));

//Get the axis
xaxis = (D - A);
yaxis = (S - W);

//Check for gamepad input
if (gamepad_is_connected(0)) {
    gamepad_set_axis_deadzone(0, .35);
    xaxis = gamepad_axis_value(0, gp_axislh);
    yaxis = gamepad_axis_value(0, gp_axislv);
    dash = gamepad_button_check_pressed(0, gp_face1);
    attack_key = gamepad_button_check_pressed(0, gp_face3);
}
