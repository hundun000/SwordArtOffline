///@argument0 role
var role=argument0;

var weaponIns=getRoleCurWeaponInstance(role);

if(weaponIns==noone)
	return "无武器";
else
	return weaponIns.name;	