/// @desc Initialise & globals
randomize();

global.gamePaused = false;
global.textSpeed = .75;

global.iCamera = instance_create_layer(0,0, layer, obj_camera);

surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H);

room_goto(ROOM_START);