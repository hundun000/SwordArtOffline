/// @description Insert description here
// You can write your code in this editor
globalvar doMoreSelectIndex;
globalvar itemSelectIndex;
globalvar operatedRole;

globalvar playerFrontTeam;
global.playerFrontTeam=array_create(0);
globalvar playerWorldTeam;
global.playerWorldTeam=array_create(0);




globalvar cursor_pointer;
worldTeamFlag=instance_find(obj_team_flag,0);  //its a single instance
textBoxManager=instance_find(obj_textBox_manager,0);  //its a single instance

globalvar inputReceiver;
global.inputReceiver=InputReceiver.worldTeamFlag;


//********* data init*************
globalvar asuna;
globalvar kirito;
global.asuna=instance_find(obj_role_asuna,0);
global.kirito=instance_find(obj_role_kirito,0);
addRoleToWorld(global.asuna);
addRoleToWorld(global.kirito);