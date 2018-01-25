/// @description Insert description here
// You can write your code in this editor


var x_text=x;
var y_text=y;
var width_text=300;

draw_set_color(c_black);
if(manager.teamRoomState==TeamRoomState.selectingRoleOperation){
	var space=15;
	for(i=0;i<NUM_TEAM_POS;i++){
		var roleInPos=ds_list_find_value(manager.roleInTeamPos,i);
		var roleInPosName;
		if(roleInPos==noone)
			roleInPosName="无人";
		else
			roleInPosName=roleInPos.name;
		draw_text(x_text,y_text+(i+1)*(font_get_size(global.font_CN_teamRoom)+space),string(i)+"号位置:"+roleInPosName);
	}
}
else{
	var textItemInfo;
	if(manager.selectedBagItemIndex!=-1){
		var itemName=ds_grid_get(manager.selectedTeamRole.items,manager.selectedBagItemIndex,INDEX_ITEM_NAME);
		var itemIns=getItemInstanceByName(itemName);
		textItemInfo=itemIns.introduction;
	}
	else{
		textItemInfo="haven't select item";
	}
	draw_text_ext(x_text,y_text,textItemInfo,font_get_size(global.font_CN_teamRoom)+2,width_text);
}
