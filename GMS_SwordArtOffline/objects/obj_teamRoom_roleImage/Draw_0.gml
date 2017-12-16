/// @description Insert description here
// You can write your code in this editor

var i;
var x_image=x;
var y_image=y;
var imageLength=384;

var role=manager.selectedTeamRole;
var imageIndex=getPhotoIndexByName(role.name);

var resize=imageLength/sprite_get_height(spr_role_photo);

draw_sprite_ext(spr_role_photo,imageIndex,x_image,y_image,resize,resize,0,c_white,1);