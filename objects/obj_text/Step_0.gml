lerpProgress += (1 - lerpProgress) / 50;
textProgress += global.textSpeed;

x1 = lerp(x1, x1Target, lerpProgress);
x2 = lerp(x2, x2Target, lerpProgress);

if (keyboard_check(vk_space))
{
	var _messageLength = string_length(message)
	if (textProgress >= _messageLength)
	{
		instance_destroy();
		if (instance_exists(obj_textqueued))
		{
			with (obj_textqueued) ticket--;
		}
		else
		{
			with(obj_player) 
			{
				state = lastState
				skipStepEvent = true
			}
		}
	}
	else
	{
		if (textProgress > 2)
		{
			textProgress = _messageLength;
		}
	}
}