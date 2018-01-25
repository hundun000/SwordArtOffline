///@argument0 itemName

var itemName=argument0;
var itemIns=getItemInstanceByName(itemName);

if(itemIns.itemType==ItemType.weapon_sword)
	return true;
else
	return false;