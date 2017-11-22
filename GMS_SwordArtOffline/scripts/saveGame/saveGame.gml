if(file_exists("Save.sav")){
	if(file_exists("LastSave.sav")) file_delete("LastSave.sav");
	file_rename("Save.sav","LastSave.sav");
}
	
ini_open("Save.sav");

var sectionName;

sectionName="World Data";
ini_write_real(sectionName,"storyLine",global.storyLine);
ini_write_real(sectionName,"curWorldPos",global.curWorldPos);

var num_playerWorldTeam=ds_list_size(global.playerWorldTeam);
sectionName="Role Data";
var i,j;
ini_write_real(sectionName,"num_playerWorldTeam",num_playerWorldTeam);
for(i=0;i<num_playerWorldTeam;i++){
	var role=ds_list_find_value(global.playerWorldTeam,i);
	var keyName="role"+string(i)+"_";
	ini_write_string(sectionName,keyName+"name",role.name);	
	ini_write_real(sectionName,keyName+"hp",role.hp);
	ini_write_real(sectionName,keyName+"atk",role.atk);
	ini_write_real(sectionName,keyName+"def",role.def);
	ini_write_real(sectionName,keyName+"fex",role.dex);
	ini_write_real(sectionName,keyName+"curHp",role.curHp);
	ini_write_real(sectionName,keyName+"xp",role.xp);
	ini_write_real(sectionName,keyName+"lv",role.lv);
	
	ini_write_real(sectionName,keyName+"num_curItem",role.num_curItem);
	for(j=0;j<role.num_curItem;j++){
		var itemProperty=ds_grid_get(role.items,j,INDEX_ITEM_NAME);
		ini_write_string(sectionName,keyName+"item_"+string(j)+"_name",itemProperty);
		itemProperty=ds_grid_get(role.items,j,INDEX_ITEM_QUALITY);
		ini_write_real(sectionName,keyName+"item_"+string(j)+"_quality",itemProperty);
	}
	
}

ini_close();
