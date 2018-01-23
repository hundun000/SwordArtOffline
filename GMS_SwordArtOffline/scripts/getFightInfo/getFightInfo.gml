/// @argument0 fighter_0
/// @argument1 fighter_1
/// @argument2 is_exp_attackTimes As enemmy AI get fightInfo,it position always out of player's attack range,this cause a wrong attackTime

/* return list*
0~1 attack times(consider attack side type)
2~3 hit rates
4~5 pre damages
6~7 critical rates
*/


//these macro's my/rival base on argument0=me,argument=rival
#macro MY_attack_times 0
#macro RIVAL_attack_times 1
#macro MY_hit_rate 2
#macro RIVAL_hit_rate 3
#macro MY_pre_damage 4
#macro RIVAL_pre_damage 5
#macro MY_critical_rate 6
#macro RIVAL_critical_rate 7


var ans=array_create(2);
var fighter=array_create(2);
fighter[MY_attack_times]=argument0;
fighter[MY_attack_times+1]=argument1;


//if(fighter[0]==fighter[1]) return noone;



//******** 0~1 attack times(consider attack side type) ********
var dif=fighter[0].dex-fighter[1].dex;
ans[MY_attack_times]=1+(dif>=THRESHOLD_DEX);
ans[MY_attack_times+1]=1+(dif<=-THRESHOLD_DEX);

//consider attack side type
var dx=fighter[0].x-fighter[1].x;
var dy=fighter[0].y-fighter[1].y;
var Manhattan_distance=(abs(dx)+abs(dy)) div UNIT;



if(argument2){
	//if only consider expetation,simply compare both sides attack range
	if(fighter[0].roleAttackRangFrom<fighter[1].roleAttackRangFrom||fighter[0].roleAttackRangTo>fighter[1].roleAttackRangTo)
		ans[MY_attack_times+1]=0;
}
else{
	//only set rival side,consider caller is me.And as enemy is forecast,it isn't actul in range
	if(Manhattan_distance<fighter[0].roleAttackRangFrom||Manhattan_distance>fighter[0].roleAttackRangTo)
		ans[MY_attack_times]=0;
	else if(Manhattan_distance<fighter[1].roleAttackRangFrom||Manhattan_distance>fighter[1].roleAttackRangTo)
		ans[MY_attack_times+1]=0;	
}



//******** 2~3 hit rates 4~5 pre damages 6~7 critical rates ********
//let two side use the same codes by the two-times loop
for(var side=0;side<2;side++){

	//hitRate range in (33,100)% ,线性增加
	ans[MY_hit_rate+side]=floor(clamp(33+(fighter[side].dex-fighter[!side].dex*0.3)*6,33,100)); 
	
	relocateCurWeapon(fighter[side]);
	var weaponDamage=getWeaponDamageByName(getRoleCurWeaponName(fighter[side]));
	
	if(weaponDamage==-1){	
		ans[MY_attack_times+side]=0;	
		ans[MY_pre_damage+side]=clamp(fighter[side].atk-fighter[!side].def,0,fighter[side].atk);	
	}
	else{
		ans[MY_pre_damage+side]=clamp(fighter[side].atk+weaponDamage-fighter[!side].def,0,fighter[side].atk);	
	}
	
	//criticalRate range in (0,50)% ,线性增加
	ans[MY_critical_rate+side]=floor(clamp((fighter[side].dex-fighter[!side].dex*0.5)*1.5,0,50)); 
	
}





return ans;