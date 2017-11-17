/// @description Insert description here
// You can write your code in this editor
macros_ect();

globalvar doMoreSelectIndex;
globalvar itemSelectIndex;
globalvar operatedRole;

globalvar storyLine;
global.storyLine=0;
globalvar playerFrontTeam;
global.playerFrontTeam=ds_list_create();
globalvar playerWorldTeam;
global.playerWorldTeam=ds_list_create();




globalvar cursor_pointer;
//others init in Obj_worldMap.Creat
mainMenu=instance_find(obj_mainMenu,0);


globalvar inputReceiver;



//********* data init*************
global.inputReceiver=InputReceiver.mainMenu;

//init in Obj_worldMap.Creat
globalvar asuna;
globalvar kirito;
globalvar silica;


