function PlayerStateFree(){
//Movement
hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputDirection);
vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputDirection);

PlayerCollision();

//Update sprite index
var _oldSprite = sprite_index;
if (inputMagnitude != 0)
{
	direction = inputDirection
	sprite_index = spriteRun;
} else sprite_index = spriteIdle;
if (_oldSprite != sprite_index) localFrame = 0;

//Updating image index
PlayerAnimateSprite();

//Activate key logic
if (keyActivated)
{
	//1. Check for an entity to activate
	//2. If there is nothing, or there is something, but its has no script - Roll!
	//3.Otherwise, there is something and its has script! Activate !
	//4. If the thing we activate is an NPC, make it face toward us!
	var _activateX = lengthdir_x(10, direction);
	var _activateY = lengthdir_y(10, direction);
	activate = instance_position(x + _activateX, y + _activateY, obj_P_entity);
	
	//Roll if nothing to activate or no script
	if (activate == 0 || activate.entityActivateScript == -1)
	{
		state = PlayerStateRoll;
		moveDistanceRemaining = distanceRoll
	}
	else
	{
		//Activate the entity
		ScriptExecuteArray(activate.entityActivateScript, activate.entityActivateArgs);
	}
	
	//Make an NPC face the player
	if (activate.entityNPC)
	{
		with (activate)
		{
			direction = point_direction(x, y, other.x, other.y);
			image_index = CARDINAL_DIR
		}
	}
}
}
