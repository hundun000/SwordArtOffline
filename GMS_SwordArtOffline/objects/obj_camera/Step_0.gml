/// @description Insert description here
// You can write your code in this editor
#macro BTN_MAP_VIEW ord("C")

/*
moveCamera=keyboard_check(BTN_MAP_VIEW);

if(keyboard_check_pressed(BTN_MAP_VIEW)){
	tempCursorX=ins_cursor.x;
	tempCursorY=ins_cursor.y;
	object_set_visible(ins_cursor,false);
}
else if(keyboard_check_released(BTN_MAP_VIEW)){
	ins_cursor.x=tempCursorX;
	ins_cursor.y=tempCursorY;
	object_set_visible(ins_cursor,true);
}

if(moveCamera){
	x+=(keyboard_check(BTN_R)-keyboard_check(BTN_L))*moveCameraSpeed;
	y+=(keyboard_check(BTN_D)-keyboard_check(BTN_U))*moveCameraSpeed;

}
else{
*/
	x=clamp(x,follower.x-h_border,follower.x+h_border);
	y=clamp(y,follower.y-v_border,follower.y+v_border);
//}