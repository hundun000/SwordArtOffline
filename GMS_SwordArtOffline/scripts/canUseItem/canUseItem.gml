/// @argument0 itemName
/// @argument1 role

var itemName=argument0;
var role=argument1;

switch(itemName){
	case "伤药":
	case "好伤药":
		return role.curHp<role.hp;
	break;
	
	
	
}