/// @description Insert description here
// You can write your code in this editor

var i;
var x_image=x;
var y_image=y;
var imageLength=128;


var drawnSprite;

if(manager.teamRoomState==TeamRoomState.selectingRoleOperation){
	drawnSprite=spr_teamPos;
}
else{
	if(manager.selectedBagItemIndex!=-1){
		var itemName=ds_grid_get(manager.selectedTeamRole.items,manager.selectedBagItemIndex,INDEX_ITEM_NAME);
		var itemIns=getItemInstanceByName(itemName);
		drawnSprite=itemIns.sprite_index;
	}
	else
		drawnSprite=spr_item;
}




var resize=imageLength/sprite_get_height(drawnSprite);

draw_sprite_ext(drawnSprite,0,x_image,y_image,resize,resize,0,c_white,1);