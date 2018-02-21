/// @argument0 role
/// @argument1 state

var role=argument0;
var to=argument1;

switch(to){
	case RoleState.idle:
		role.roleState=RoleState.idle;
		role.image_blend=c_white;
		role.depth=DEPTH_ROLE_IDLE;
		break;
		
	case RoleState.selected:	
		var weaponIns=getRoleCurWeaponInstance(role);
		var attackRangFrom;
		var attackRangTo;
		if(weaponIns!=noone){
			attackRangFrom=weaponIns.weaponAttackRangFrom;
			attackRangTo=weaponIns.weaponAttackRangTo;
		}
		else{
			attackRangFrom=0;
			attackRangTo=0;
		}	
		newPourWater(role.x,role.y,role.roleType,role.MAX_MOVEMENT,attackRangFrom,attackRangTo,ControlType.player,true);
		role.depth=DEPTH_ROLE_MOVING;
		break;		
		
	case RoleState.doMore:	
		var weaponIns=getRoleCurWeaponInstance(role);
		var attackRangFrom;
		var attackRangTo;
		if(weaponIns!=noone){
			attackRangFrom=weaponIns.weaponAttackRangFrom;
			attackRangTo=weaponIns.weaponAttackRangTo;			
		}
		else{
			attackRangFrom=0;
			attackRangTo=0;
		}
		if(attackRangFrom!=0)
			newBuildCanAttackTile(role.x,role.y,attackRangFrom,attackRangTo,true);
		break;	
		
	case RoleState.gray:
		role.roleState=RoleState.gray;
		role.image_blend=c_gray;
		role.depth=DEPTH_ROLE_IDLE;
		break;

}