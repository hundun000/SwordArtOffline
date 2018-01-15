/// @description Insert description here
// You can write your code in this editor
if(global.inputReceiver!=InputReceiver.homeManager)	return;


if(isA){
	switch(selectedHomeOptionIndex)
	{
		case HOME_GOTO_MAP:
			room_goto(room_world);	
		break;
		
		default:
	}


}
else if(input_dy!=0){
	selectedHomeOptionIndex+=input_dy;
	if(selectedHomeOptionIndex<0){
		selectedHomeOptionIndex=num_option-1;
	}
	else if(selectedHomeOptionIndex==num_option){
		selectedHomeOptionIndex=0;
	}
}