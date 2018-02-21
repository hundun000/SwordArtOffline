/// @description Insert description here
// You can write your code in this editor
if(global.inputReceiver!=InputReceiver.HOME)	return;


if(isA){
	switch(selectedHomeOptionIndex)
	{
		case HOME_GOTO_MAP:
			room_goto(room_world);	
			break;
		case HOME_EDIT_TEAM_MENBER:
			room_goto(room_team);
			break;
		case HOME_EDIT_TEAM_LAYUOT:
			room_goto(room_teamLayout);
			break;	
		case HOME_LOAD:
			loadGame();
			show_message("Game load");
			break;
		case HOME_SAVE:	
			saveGame();
			show_message("Game save");	
			break;
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