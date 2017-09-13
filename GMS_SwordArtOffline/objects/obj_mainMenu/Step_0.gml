/// @description Insert description here
// You can write your code in this editor
var move=0;
move+=max(keyboard_check_pressed(vk_up),0);
move+=max(keyboard_check_pressed(vk_down),0);


if(move!=0){
	curOption+=move;
	if(curOption<0)
		curOption=array_length_1d(option)-1;
	 else if(curOption==array_length_1d(option))
		curOption=0;

}


var push=0;
push+=max(keyboard_check_released(ord("Z")),0);
if(push!=0)
	scr_mainMenu();