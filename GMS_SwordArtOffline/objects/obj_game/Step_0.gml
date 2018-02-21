/// @description Insert description here


#macro BTN_A ord("Z")
#macro BTN_B ord("X")
#macro BTN_U vk_up
#macro BTN_D vk_down
#macro BTN_L vk_left
#macro BTN_R vk_right

enum InputReceiver{
	CURSOR,
	WORLD_MAP,
	TEXT_BOX,
	MAIN_MENU,
	TEAM_MENBER,
	FIGHT_ROOM,
	HOME,
	TEAM_LAYOUT

}


var isA_game=keyboard_check_pressed(BTN_A);
var isB_game=keyboard_check_pressed(BTN_B);
var dx_game=keyboard_check_pressed(BTN_R)-keyboard_check_pressed(BTN_L);
var dy_game=keyboard_check_pressed(BTN_D)-keyboard_check_pressed(BTN_U);

var reciever;
switch(global.inputReceiver){
	case InputReceiver.WORLD_MAP:
		reciever=worldMapManager;
		break;
	case InputReceiver.CURSOR:
		reciever=playerFrontManager;
		break;
	case InputReceiver.TEXT_BOX:
		reciever=textBoxManager;
		break;	
	case InputReceiver.MAIN_MENU:
		reciever=mainMenu;
		break;	
	case InputReceiver.TEAM_MENBER:
		reciever=teamRoomManager;
		break;
	case InputReceiver.TEAM_LAYOUT:
		reciever=teamLayoutManager;
		break;		
	case InputReceiver.HOME:
		reciever=homeManager;
		break;
	case InputReceiver.FIGHT_ROOM:
		reciever=noone;
		break;
}

//only set the reciever
if(reciever!=noone){
	reciever.isA=isA_game;
	reciever.isB=isB_game;
	reciever.input_dx=dx_game;
	reciever.input_dy=dy_game;
}
