/// @description Insert description here
// You can write your code in this editor
if(!isPropertiesInit){
	var properties=getRoleProperties(name,lv);
	
	hp=properties[INDEX_HP];
	atk=properties[INDEX_ATK];
	def=properties[INDEX_DEF];
	dex=properties[INDEX_DEX];
	xp=properties[INDEX_XP];
	
	curHp=hp;
	
	
	
	
	isPropertiesInit=true;
}




switch(enemyState){
	case EnemyState.pathReady:
		if(path_get_length(rolePath)>0){
			path_start(rolePath,4,path_action_stop,false);
			//path_delete(rolePath);
			enemyState=EnemyState.moving;
		}
		else{
			enemyState=EnemyState.moved;
			with(obj_enemyManager){
				enemyManagerState=EnemyManagerState.moved;
			}
		}

		break;
	case EnemyState.moved:	
		//fake is delay over
		
		
		break;
	default:


}