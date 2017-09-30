/// @description Insert description here
// You can write your code in this editor

if(target_x!=-1){
	if(point_distance(x, y, target_x, target_y)<=speed){
		x=target_x;
		y=target_y;
		speed=0;
		
		target_x=-1;
		
		with(obj_textBox_manager){
			delay=10;
			scenceState=ScenceState.delayCountDown;
		}
	}

}
