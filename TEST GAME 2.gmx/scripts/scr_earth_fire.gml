///scr_earth_fire
scr_hotkeys();

//Fire the cooldude
if mouse_check_button_pressed(mouse_left) {
    cooldude = instance_create(x, y, obj_cooldude);
    
    cooldude.direction = point_direction(x, y, mouse_x, mouse_y);
    
    cooldude.image_angle = point_direction(x, y, mouse_x, mouse_y);
    
    cooldude.speed = 13.37;   
    
    audio_play_sound(sound_fire, 1, false);    
}
