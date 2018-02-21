/// @description Insert description here
// You can write your code in this editor
if(enemyManagerState==EnemyManagerState.fighting){

	if(room!=room_fight){
		enemyManagerState=EnemyManagerState.nextEnemy;
	}
	
}