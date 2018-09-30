/// @description Do level selection with Left/Right cursors

if(keyboard_check_released(vk_left))
{
	if(CurrentLevel>0) CurrentLevel--;
	ChangeLevel(CurrentLevel);
}

if(keyboard_check_released(vk_right))
{
	if(CurrentLevel<19) CurrentLevel++;
	ChangeLevel(CurrentLevel);
}
