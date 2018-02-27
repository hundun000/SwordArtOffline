///@argument0 role
///@argument1 indexSwitchTo

var role=argument0;
var indexSwitchTo=argument1;


var itemName=ds_grid_get(role.items,indexSwitchTo,INDEX_ITEM_NAME);
var itemIns=getItemInstanceByName(itemName);
if(itemIns.itemType==role.weaponProfession){
	role.curWeaponIndex=indexSwitchTo;
	return true;
}
else
	return false;

