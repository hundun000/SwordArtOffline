/// @description Insert description here
// You can write your code in this editor
#macro BTN_MAP_VIEW ord("C")


//moveCamera=keyboard_check(BTN_MAP_VIEW);

/*
if(moveCamera){
	x+=(keyboard_check(BTN_R)-keyboard_check(BTN_L))*moveCameraSpeed;
	y+=(keyboard_check(BTN_D)-keyboard_check(BTN_U))*moveCameraSpeed;
}
else{
*/
	x=clamp(x,follower.x-h_border,follower.x+h_border);
	y=clamp(y,follower.y-h_border,follower.y+h_border);
//}