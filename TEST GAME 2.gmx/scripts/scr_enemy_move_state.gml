///scr_enemy_move_state

//Facing
image_angle = point_direction(x, y, obj_GANGSTEREARTH.x, obj_GANGSTEREARTH.y);

if (image_angle > 90 && image_angle < 270 && !rotated){
   image_yscale = -image_yscale;
   rotated = true;
}

image_speed = 5;

//Move towards eARTH
move_towards_point(obj_GANGSTEREARTH.x, obj_GANGSTEREARTH.y, spd);
