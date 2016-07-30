///scr_enemy_spawn
view_xview[0]=x-(view_wview[0]/2);
view_yview[0]=y-(view_hview[0]/2);

x += (obj_GANGSTEREARTH.x - x) * .3;
y += (obj_GANGSTEREARTH.y - y) * .3;

scr_enemy_stats();

width = obj_GANGSTEREARTH.width;
height = obj_GANGSTEREARTH.height;
spawnSpeed = obj_GANGSTEREARTH.spawnSpeed;

SecondsSinceLastEnemySpawn += spawnSpeed / room_speed;

if (SecondsSinceLastEnemySpawn >= spawnRate && !setSpawn) {
    //Spawn Enemy
    instance_create(random(room_width) + minRange, random(room_height) + minRange, self);     
    SecondsSinceLastEnemySpawn = 0;
} else {
  //Spawn Enemy
  instance_create(xSpawn, ySpawn, self);
  SecondsSinceLastEnemySpawn = 0;
}
