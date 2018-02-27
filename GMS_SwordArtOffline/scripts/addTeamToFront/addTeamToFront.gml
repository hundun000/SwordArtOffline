var targetRoom=argument0;

var origin_x;
var origin_y;

switch(targetRoom){
	case room_battle_1_1:
		origin_x=0*UNIT;
		origin_y=3*UNIT;				
		break;	
	case room_battle_2_1:
		origin_x=2*UNIT;
		origin_y=7*UNIT;				
		break;		

}
origin_x+=0.5*UNIT;
origin_y+=0.5*UNIT;

var manager=global.thisGame.teamLayoutManager;
var size=ds_list_size(manager.teamLayoutSlots);
for(var i=0;i<size;i++){
	var role=ds_list_find_value(manager.teamLayoutSlots,i);
	if(role!=noone){
		role.x=origin_x+manager.posShift_x[i]*UNIT;
		role.y=origin_y+manager.posShift_y[i]*UNIT;
		role.visible=true;
		role.isFront=true; //use flag to sign role is in TeamFront
		ds_list_add(global.playerFrontTeam,role);
		
		//heal to full hp and clear buff
		role.curHp=role.hp;
		role.buffAtk=0;
		role.buffDef=0;
		role.buffDex=0;
	
	}
}
