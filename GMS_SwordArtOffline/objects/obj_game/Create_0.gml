/// @description Insert description here
// You can write your code in this editor
macros_ect();



global.thisGame=id;




mainMenu=instance_find(obj_mainMenu,0);
textBoxManager=instance_find(obj_textBox_manager,0); 
playerFrontManager=instance_find(obj_playerFrontManager,0);
teamRoomManager=instance_find(obj_teamRoomManager,0);
//others init in Obj_worldMap.Creat
worldTeamFlag=noone;  






					

//********* data init*************
global.inputReceiver=InputReceiver.mainMenu;

//const value
worldX[0]=660;
worldY[0]=579;
worldX[1]=539;
worldY[1]=496;	


resetWorldData();


