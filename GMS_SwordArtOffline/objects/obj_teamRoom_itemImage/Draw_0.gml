/// @description Insert description here
// You can write your code in this editor

var i;
var x_image=x;
var y_image=y;
var imageLength=128;


var imageIndex;
if(manager.selectedBagItemIndex!=-1){
	var itemName=ds_grid_get(manager.selectedTeamRole.items,manager.selectedBagItemIndex,INDEX_ITEM_NAME);
	imageIndex=getItemSubImageByName(itemName);
}
else
{
	imageIndex=0;
}

var resize=imageLength/sprite_get_height(spr_item);

draw_sprite_ext(spr_item,imageIndex,x_image,y_image,resize,resize,0,c_white,1);