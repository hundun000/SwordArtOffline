if(file_exists("Save.sav")){
	if(file_exists("LastSave.sav")) file_delete("LastSave.sav");
	file_rename("Save.sav","LastSave.sav");
}
	
ini_open("Save.sav");

var sectionName;
var i,j;

sectionName="World Data";
ini_write_real(sectionName,"storyLine",global.storyLine);
ini_write_real(sectionName,"curWorldPos",global.curWorldPos);
ini_write_real(sectionName,"curNumPublicBoxItem",global.curNumPublicBoxItem);
for(i=0;i<global.curNumPublicBoxItem;i++){
	var itemProperty=ds_grid_get(global.publicBox,i,INDEX_ITEM_NAME);
	ini_write_string(sectionName,"publicBoxItem_"+string(i)+"_name",itemProperty);
	itemProperty=ds_grid_get(global.publicBox,i,INDEX_ITEM_QUALITY);
	ini_write_real(sectionName,"publicBoxItem_"+string(i)+"_quality",itemProperty);
}

sectionName="Role Data";
var num_playerWorldTeam=ds_list_size(global.playerWorldTeam);
ini_write_real(sectionName,"num_playerWorldTeam",num_playerWorldTeam);
for(i=0;i<num_playerWorldTeam;i++){
	var role=ds_list_find_value(global.playerWorldTeam,i);
	var keyName="role"+string(i)+"_";
	ini_write_string(sectionName,keyName+"name",role.name);	
	ini_write_real(sectionName,keyName+"hp",role.hp);
	ini_write_real(sectionName,keyName+"atk",role.atk);
	ini_write_real(sectionName,keyName+"def",role.def);
	ini_write_real(sectionName,keyName+"dex",role.dex);
	ini_write_real(sectionName,keyName+"curHp",role.curHp);
	ini_write_real(sectionName,keyName+"xp",role.xp);
	ini_write_real(sectionName,keyName+"lv",role.lv);
	
	ini_write_real(sectionName,keyName+"curNumItem",role.curNumItem);
	for(j=0;j<role.curNumItem;j++){
		var itemProperty=ds_grid_get(role.items,j,INDEX_ITEM_NAME);
		ini_write_string(sectionName,keyName+"item_"+string(j)+"_name",itemProperty);
		itemProperty=ds_grid_get(role.items,j,INDEX_ITEM_QUALITY);
		ini_write_real(sectionName,keyName+"item_"+string(j)+"_quality",itemProperty);
	}
	
}

ini_close();
