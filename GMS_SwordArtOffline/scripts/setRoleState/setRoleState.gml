/// @argument0 role
/// @argument1 state

var role=argument0;
var to=argument1;

switch(to){
	case RoleState.selected:
		newPourWater(role.x,role.y,role.roleType,role.MAX_MOVEMENT,role.roleAttackRangFrom,role.roleAttackRangTo,ControlType.player,true);
		break;
	case RoleState.doMore:
		newBuildCanAttackTile(role.x,role.y,role.roleAttackRangFrom,role.roleAttackRangTo,true);
		break;			
	case RoleState.gray:
		role.roleState=RoleState.gray;
		role.image_blend=c_gray;
		break;
	default:
}