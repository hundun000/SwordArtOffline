/// @description Insert description here
// You can write your code in this editor
macros_ect();



global.thisGame=id;




mainMenu=instance_find(obj_mainMenu,0);
textBoxManager=instance_find(obj_textBox_manager,0); 
playerFrontManager=instance_find(obj_playerFrontManager,0);
teamRoomManager=instance_find(obj_teamRoomManager,0);
homeManager=instance_find(obj_homeManager,0);
worldMapManager=instance_find(obj_worldMapManager,0);



global.font_CN_textBox=font_add("ARIALUNI_fixed.ttf",32,0,0,32,128);
global.font_CN_teamRoom=font_add("ARIALUNI_fixed.ttf",20,0,0,32,128);
global.font_CN_homeMenu=font_add("ARIALUNI_fixed.ttf",20,0,0,32,128);
global.font_CN_mainMenu=font_add("ARIALUNI_fixed.ttf",20,0,0,32,128);




					

//********* data init*************
global.inputReceiver=InputReceiver.mainMenu;



resetWorldData();


