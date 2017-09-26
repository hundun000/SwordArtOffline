switch(global.curMap){
	case 0:
		return ds_list_size(global.frontEnemies)==0;
	default:
		return false;
}