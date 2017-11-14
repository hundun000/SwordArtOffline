/// @description Insert description here
// You can write your code in this editor
var lastReceiver=global.inputReceive;
global.inputReceiver=InputReceiver.textBox;
with(obj_textBox_manager){
	//wake up for handle scene
	scenceState=ScenceState.nextElement;
}

var roleName=diedRole.name;
addSceneTextBox(roleName,getDyingMessageByName(roleName),0);
addSceneChangeRoom(noone,lastReceiver);

ds_list_delete(global.playerWorldTeam,(ds_list_find_index(global.playerWorldTeam,diedRole)));
ds_list_delete(global.playerFrontTeam,(ds_list_find_index(global.playerFrontTeam,diedRole)));		

if(diedRole==global.kirito){
	show_message("lead die");	
}

instance_destroy(id);