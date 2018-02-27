/// @description Insert description here
// You can write your code in this editor
if(room==room_home){
	//blind inputreciever with romm
	global.inputReceiver=InputReceiver.HOME;
	
	selectedHomeOptionIndex=0;
	
	var mateRole=ds_list_find_value(global.thisGame.teamLayoutManager.teamLayoutSlots,MATE_POS);
	if(mateRole!=noone)
		curHomeMateSpriteIndex=mateRole.homeMateSpriteIndex;
	else
		curHomeMateSpriteIndex=0;
		
	draw_set_font(ROOM_FONT);	
}