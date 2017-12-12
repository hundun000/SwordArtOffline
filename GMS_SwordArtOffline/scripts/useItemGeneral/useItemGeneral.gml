///@argument0 role
///@argument1 itemIndex

var role=argument0;
var itemIndex=argument1;
var itemName=ds_grid_get(role.items,itemIndex,INDEX_ITEM_NAME);
var spriteWorkItem;
var returnArg;


var messageText=itemName+" Used.";

switch(itemName){
	case "cover drug":
	
		returnArg[0]=spr_workItem_coverDrug;
		
		var before=role.curHp;
		role.curHp=clamp(role.curHp+10,role.curHp,role.hp);
		messageText+=role.name+" cover from "+string(before)+" to "+string(role.curHp);
		
		break;
	default:
		messageText="no defined itemName";
}

var itemQuality=ds_grid_get(role.items,itemName,INDEX_ITEM_QUALITY);
ds_grid_set(role.items,itemName,INDEX_ITEM_QUALITY,itemQuality-1);

returnArg[1]=messageText;

return returnArg;