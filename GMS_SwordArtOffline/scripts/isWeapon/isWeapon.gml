///@argument0 itemName

var itemName=argument0;
var itemIns=getItemInstanceByName(itemName);

if(itemIns.itemType==ItemType.weapon_sword
	||itemIns.itemType==ItemType.weapon_knife
	||itemIns.itemType==ItemType.weapon_enemy
	)
	return true;
else
	return false;