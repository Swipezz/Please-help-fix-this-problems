state = PlayerStateFree;
lastState = state

collisionMap = layer_tilemap_get_id(layer_get_id("Collision"));

image_speed = 0;
hSpeed = 0;
vSpeed = 0;
speedWalk = 2.0;
speedRoll = 3.0;
distanceRoll = 52;

spriteRoll = spr_player_roll
spriteRun = spr_player_run;
spriteIdle = spr_player;
localFrame = 0;
skipStepEvent = false;