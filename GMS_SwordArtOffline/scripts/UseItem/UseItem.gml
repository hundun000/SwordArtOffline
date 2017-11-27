///@argument0 role
///@argument1 itemIndex

var role=argument0;
var itemIndex=argument1;
var itemName=ds_grid_get(role.items,itemIndex,INDEX_ITEM_NAME);
var spriteWorkItem;



var messageText=itemName+" Used.";

switch(itemName){
	case "cover drug":
		spriteWorkItem=spr_workItem_coverDrug;
		var before=role.curHp;
		role.curHp=clamp(role.curHp+10,role.curHp,role.hp);
		messageText+=role.name+" cover from "+string(before)+" to "+string(role.curHp);
		break;
	
}

var instance=instance_create_depth(role.x,role.y,role.depth-1,obj_workItem);
instance.sprite_index=spriteWorkItem;
instance.messageText=messageText;

var itemQuality=ds_grid_get(role.items,itemName,INDEX_ITEM_QUALITY);
ds_grid_set(role.items,itemName,INDEX_ITEM_QUALITY,itemQuality-1);


