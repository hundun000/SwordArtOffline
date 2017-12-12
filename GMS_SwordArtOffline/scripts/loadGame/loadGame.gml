if(!file_exists("Save.sav")){
	return;
}
	
var defultValue=-1;

ini_open("Save.sav");

var sectionName;
var i,j;

sectionName="World Data";
global.storyLine=ini_read_real(sectionName,"storyLine",defultValue);
global.curWorldPos=ini_read_real(sectionName,"curWorldPos",defultValue);
global.curNumPublicBoxItem=ini_read_real(sectionName,"curNumPublicBoxItem",defultValue);
for(i=0;i<global.curNumPublicBoxItem;i++){
	var itemProperty=ini_read_string(sectionName,"publicBoxItem_"+string(i)+"_name",defultValue);
	ds_grid_set(global.publicBox,i,INDEX_ITEM_NAME,itemProperty);
	itemProperty=ini_read_real(sectionName,"publicBoxItem_"+string(i)+"_quality",defultValue);
	ds_grid_set(global.publicBox,i,INDEX_ITEM_QUALITY,itemProperty);
}

sectionName="Role Data";
ds_list_clear(global.playerWorldTeam);

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
	var curNumItem=ini_read_real(sectionName,keyName+"curNumItem",defultValue);
	role.curNumItem=curNumItem;
	for(j=0;j<curNumItem;j++){
		var itemProperty=ini_read_string(sectionName,keyName+"item_"+string(j)+"_name",defultValue);
		ds_grid_set(role.items,j,INDEX_ITEM_NAME,itemProperty);
		itemProperty=ini_read_real(sectionName,keyName+"item_"+string(j)+"_quality",defultValue);
		ds_grid_set(role.items,j,INDEX_ITEM_QUALITY,itemProperty);
	}
	
}

ini_close();

