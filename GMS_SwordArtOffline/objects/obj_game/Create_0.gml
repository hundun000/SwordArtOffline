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

globalvar thisGame;
thisGame=id;


globalvar cursor_pointer;
//others init in Obj_worldMap.Creat
mainMenu=instance_find(obj_mainMenu,0);
worldTeamFlag=noone;  
textBoxManager=noone; 
playerFrontManager=noone;

globalvar inputReceiver;

					

//********* data init*************
global.inputReceiver=InputReceiver.mainMenu;

//const value
worldX[0]=660;
worldY[0]=579;
worldX[1]=539;
worldY[1]=496;	



//init by script
globalvar asuna;
globalvar kirito;
globalvar silica;

resetWorldData();


