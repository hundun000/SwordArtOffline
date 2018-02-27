///@argument0 role
var role=argument0;

if(role.curWeaponIndex==-1){
	for(var i=0;i<role.curNumItem;i++){
		var isSuccess=switchCurWeapon(role,i);
		if(isSuccess){
			return;
		}
	}
}