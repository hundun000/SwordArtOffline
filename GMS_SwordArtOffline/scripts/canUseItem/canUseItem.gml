/// @argument0 itemName
/// @argument1 role

var itemName=argument0;
var role=argument1;

switch(itemName){
	case "cover drug":
		return role.curHp<role.hp;
	break;
	
	
	
}