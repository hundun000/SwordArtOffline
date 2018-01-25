///@argument0 role
var role=argument0;

relocateCurWeapon(role);

var weaponName;

if(role.curWeaponIndex==-1)
	return noone;
else{
	weaponName=ds_grid_get(role.items,role.curWeaponIndex,INDEX_ITEM_NAME);	
	return getItemInstanceByName(weaponName);	
}
	
	