/// @description Insert description here
// You can write your code in this editor
macros_ect();



global.thisGame=id;


mainMenu=instance_find(obj_mainMenu,0);

textBoxManager=noone;
playerFrontManager=noone;
enemyFrontManager=noone;
teamRoomManager=noone;
homeManager=noone;
worldMapManager=noone;
fightManager=noone;


global.font_CN_textBox=font_add("ARIALUNI_fixed.ttf",32,0,0,32,128);
global.font_CN_teamRoom=font_add("ARIALUNI_fixed.ttf",20,0,0,32,128);
global.font_CN_homeMenu=font_add("ARIALUNI_fixed.ttf",20,0,0,32,128);
global.font_CN_mainMenu=font_add("ARIALUNI_fixed.ttf",20,0,0,32,128);
global.font_CN_fightForecast=font_add("ARIALUNI_fixed.ttf",15,0,0,32,128);
global.font_CN_fightRoom=font_add("ARIALUNI_fixed.ttf",30,0,0,32,128);


					

//********* data init*************
global.inputReceiver=InputReceiver.mainMenu;



