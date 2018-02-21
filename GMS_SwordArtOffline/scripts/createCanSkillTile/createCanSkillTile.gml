///@argument0 role

var role=argument0;


var skillIns=getItemInstanceByName(role.skillName);
var skillRangeFrom;
var skillRangeTo;

if(skillIns!=noone){
	skillRangeFrom=skillIns.skillRangeFrom;
	skillRangeTo=skillIns.skillRangeTo;
	
	var r;
	var ddx;
	var ddy;
	var ssign;
	for(r=skillRangeFrom;r<=skillRangeTo;r++)
		for(ddx=-r;ddx<=r;ddx++)
			for(ssign=-1;ssign<=1;ssign+=2){
				ddy=ssign*(r-abs(ddx));
				var newIns=instance_create_layer(role.x+ddx*UNIT,role.y+ddy*UNIT,CAN_MOVE_LAYER,obj_canSkill);
			}
}