///@argument0 role
var role=argument0;

if(role.curWeaponIndex==-1){
	for(var i=0;i<NUM_ROLE_ITEM;i++){
		var itemName=ds_grid_get(role.items,i,INDEX_ITEM_NAME);
		if(isWeapon(itemName)){
			role.curWeaponIndex=i;
			return;
		}
	}
}