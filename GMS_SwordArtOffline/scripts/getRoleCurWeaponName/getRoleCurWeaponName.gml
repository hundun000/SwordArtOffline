///@argument0 role
var role=argument0;

relocateCurWeapon(role);

if(role.curWeaponIndex==-1)
	return "无武器";
else
	return ds_grid_get(role.items,role.curWeaponIndex,INDEX_ITEM_NAME);	