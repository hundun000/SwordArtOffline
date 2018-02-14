/// @description Insert description here
// You can write your code in this editor

var i;
var x_text=x;
var y_text=y;
var space=20;

/*
if(manager.teamRoomState==TeamRoomState.selectingRoleOperation){
	var size=array_length_1d(manager.roleOperationName);
	for(i=0;i<size;i++){

		if(i==manager.selectedRoleOperationIndex){
			draw_set_color(c_orange);
			if(manager.teamRoomState==TeamRoomState.selectingRoleOperation){
				draw_text(x_text,y_text+i*(font_get_size(global.font_CN_teamRoom)+space),manager.roleOperationName[i]+"<<");
			}
			else {
				draw_text(x_text,y_text+i*(font_get_size(global.font_CN_teamRoom)+space),manager.roleOperationName[i]+">>");
			}
		}
		else{
			draw_set_color(c_black);
			draw_text(x_text,y_text+i*(font_get_size(global.font_CN_teamRoom)+space),manager.roleOperationName[i]);
		}
	}	
}
else */
if(manager.teamRoomState!=TeamRoomState.selectingRole){

	var size=array_length_1d(manager.itemOperationName);
	for(i=0;i<size;i++){

		if(i==manager.selectedItemOperationIndex){
			draw_set_color(c_orange);
			if(manager.teamRoomState==TeamRoomState.selectingItemOperation){
				draw_text(x_text,y_text+i*(font_get_size(global.font_CN_teamRoom)+space),manager.itemOperationName[i]+"<<");
			}
			else {
				draw_text(x_text,y_text+i*(font_get_size(global.font_CN_teamRoom)+space),manager.itemOperationName[i]+">>");
			}
		}
		else{
			draw_set_color(c_black);
			draw_text(x_text,y_text+i*(font_get_size(global.font_CN_teamRoom)+space),manager.itemOperationName[i]);
		}
	}
}