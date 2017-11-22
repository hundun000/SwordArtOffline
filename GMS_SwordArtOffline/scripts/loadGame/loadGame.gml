if(!file_exists("Save.sav")){
	return;
}
	
var defultValue=-1;

ini_open("Save.sav");

var sectionName;

sectionName="World Data";
global.storyLine=ini_read_real(sectionName,"storyLine",defultValue);
global.curWorldPos=ini_read_real(sectionName,"curWorldPos",defultValue);


ds_list_clear(global.playerWorldTeam);
sectionName="Role Data";
var i,j;
var num_playerWorldTeam=ini_read_real(sectionName,"num_playerWorldTeam",defultValue);
for(i=0;i<num_playerWorldTeam;i++){
	var keyName="role"+string(i)+"_";	
	var name=ini_read_string(sectionName,keyName+"name",defultValue);
	var role=getRoleByName(name);
	ds_list_add(global.playerWorldTeam,role);
	
	role.hp=ini_read_real(sectionName,keyName+"hp",defultValue);
	role.atk=ini_read_real(sectionName,keyName+"atk",defultValue);
	role.def=ini_read_real(sectionName,keyName+"def",defultValue);
	role.dex=ini_read_real(sectionName,keyName+"dex",defultValue);
	role.curHp=ini_read_real(sectionName,keyName+"curHp",defultValue);
	role.xp=ini_read_real(sectionName,keyName+"xp",defultValue);
	role.lv=ini_read_real(sectionName,keyName+"lv",defultValue);
	
	
	ds_grid_clear(role.items,noone);
	var num_curItem=ini_read_real(sectionName,keyName+"num_curItem",defultValue);
	role.num_curItem=num_curItem;
	for(j=0;j<num_curItem;j++){
		var itemProperty=ini_read_string(sectionName,keyName+"item_"+string(j)+"_name",defultValue);
		ds_grid_set(role.items,j,INDEX_ITEM_NAME,itemProperty);
		itemProperty=ini_read_real(sectionName,keyName+"item_"+string(j)+"_quality",defultValue);
		ds_grid_set(role.items,j,INDEX_ITEM_QUALITY,itemProperty);
	}
	
}

ini_close();

