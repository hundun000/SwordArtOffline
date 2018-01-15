///@argument0 role
///@argument1 itemIndex

var role=argument0;
var itemIndex=argument1;
var itemName=ds_grid_get(role.items,itemIndex,INDEX_ITEM_NAME);
var spriteWorkItem;
var returnArg;


var messageText="使用了"+itemName+"，";

switch(itemName){
	case "伤药":
	
		returnArg[0]=spr_workItem_coverDrug;
		
		var before=role.curHp;
		role.curHp=clamp(role.curHp+10,role.curHp,role.hp);
		messageText+=role.name+"的HP从"+string(before)+"恢复到了"+string(role.curHp)+"。";
		
		break;
	case "好伤药":
	
		returnArg[0]=spr_workItem_goodCoverDrug;
		
		var before=role.curHp;
		role.curHp=clamp(role.curHp+20,role.curHp,role.hp);
		messageText+=role.name+"的HP从"+string(before)+" to "+"恢复到了"+string(role.curHp)+"。";
		
		break;		
	default:
		messageText="使用 道具名未定义！";
}

var itemQuality=ds_grid_get(role.items,itemIndex,INDEX_ITEM_QUALITY);
if(itemQuality-1>0)
	ds_grid_set(role.items,itemIndex,INDEX_ITEM_QUALITY,itemQuality-1);
else{	
	ds_grid_set(role.items,itemIndex,INDEX_ITEM_QUALITY,noone);
	ds_grid_set(role.items,itemIndex,INDEX_ITEM_NAME,noone);
	role.curNumItem--;
}

returnArg[1]=messageText;

return returnArg;