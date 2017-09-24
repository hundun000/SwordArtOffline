/// @argument0 fighter_0
/// @argument1 fighter_1

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
fighter[0]=argument0;
fighter[1]=argument1;


//if(fighter[0]==fighter[1]) return noone;



//******** 0~1 attack times(consider attack side type) ********
var dif=fighter[0].dex-fighter[1].dex;
ans[0]=1+(dif>=THRESHOLD_DEX);
ans[1]=1+(dif<=-THRESHOLD_DEX);

//consider attack side type
var dx=fighter[0].x-fighter[1].x;
var dy=fighter[0].y-fighter[1].y;
var Manhattan_distance=(abs(dx)+abs(dy)) div UNIT;
//only set rival side,consider caller is me.And as enemy is forecast,it isn't actul in range
if(Manhattan_distance<fighter[1].roleAttackRangFrom||Manhattan_distance>fighter[1].roleAttackRangTo)
	ans[1]=0;

var curAnsIndex=2;


//******** 2~3 hit rates 4~5 pre damages 6~7 critical rates ********
//let two side use the same codes by the two-times loop
for(var side=0;side<2;side++){

	//hitRate range in (33,100)% ,线性增加
	ans[curAnsIndex+side]=floor(clamp(33+(fighter[side].dex-fighter[!side].dex*0.3)*6,33,100)); 
	
	ans[curAnsIndex+2+side]=fighter[side].atk-fighter[!side].def;
	
	//criticalRate range in (0,50)% ,线性增加
	ans[curAnsIndex+4+side]=floor(clamp((fighter[side].dex-fighter[!side].dex*0.5)*1.5,0,50)); 
	
}
curAnsIndex+=6;




return ans;