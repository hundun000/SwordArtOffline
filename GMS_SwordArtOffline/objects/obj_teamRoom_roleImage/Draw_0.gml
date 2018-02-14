/// @description Insert description here
// You can write your code in this editor

var i;
var x_image=x;
var y_image=y;
var imageLength=384;


var imageIndex;
var drawnSprite;


var role=manager.selectedTeamRole;
drawnSprite=spr_playerRole_photo;
imageIndex=getPhotoIndexByName(role.name);



var resize=imageLength/sprite_get_height(drawnSprite);
draw_sprite_ext(drawnSprite,imageIndex,x_image,y_image,resize,resize,0,c_white,1);