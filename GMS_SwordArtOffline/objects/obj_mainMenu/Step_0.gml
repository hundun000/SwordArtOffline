/// @description Insert description here
// You can write your code in this editor
if(global.inputReceiver!=InputReceiver.mainMenu) return;

if(input_dy!=0){
		targetOptionIndex=(numOption+targetOptionIndex+input_dy)%numOption;
}

if(isA){
	switch(targetOptionIndex){
		case 0:
			loadGame();
			room_goto(room_home);
			
			break;
		case 1:			
			resetWorldData();
			room_goto(room_home);
			
			break;	
		case 2:
			game_end();
			break;
		default:	
	}
}

