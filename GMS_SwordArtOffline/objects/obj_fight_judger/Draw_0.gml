/// @description Insert description here
// You can write your code in this editor


	var top_y=145;
	var bottom_y=150;
	var left_x;
	left_x[FIGHT_L]=32;
	left_x[FIGHT_R]=150;
	var rate_remainHp;
	var color_HpBar;	
	
	
if(reduceHpAnimationCountDown>=0 && reduceHpAnimationCountDown<STEP_reduceHpAnimation){

/*
	//other side
	var rate_remainHp=(fighter[!global.curAttackSide].curHp-actulDamage) div fighter[!global.curAttackSide].hp;
	var rate_reduceAnimation=reduceHpAnimationCountDown div STEP_reduceHpAnimation;
			
	var len_beforeHpBar=LEN_FULL_HP* fighter[!global.curAttackSide].curHp div fighter[!global.curAttackSide].hp;
	var len_remainHpBar=LEN_FULL_HP*rate_remainHp;
	//var len_reducedHpBar=(len_beforeHpBar-len_remainHpBar)*(1-rate_reduceAnimation);
	//var len_curHpBar=len_beforeHpBar-len_reducedHpBar;
			
	//cur side
	var rate_remainHp1=fighter[global.curAttackSide].curHp div fighter[global.curAttackSide].hp;
	var len_remainHpBar1=LEN_FULL_HP*rate_remainHp1;
			
	//!!!!!!!!!!!!!temporarily only use part
			
	var color_reduceHpBar=c_gray;
	
	if(rate_remainHp>0.5)
		color_curHpBar=c_green;
	else if(rate_remainHp>0.25)
		color_curHpBar=c_yellow;
	else
		color_curHpBar=c_red;
	*/	
			
	rate_remainHp[global.curAttackSide]=(fighter[global.curAttackSide].curHp / fighter[global.curAttackSide].hp);
	rate_remainHp[!global.curAttackSide]=((fighter[!global.curAttackSide].curHp-actulDamage) / fighter[!global.curAttackSide].hp);		
}
else{
    
	rate_remainHp[FIGHT_L]=(fighter[FIGHT_L].curHp / fighter[FIGHT_L].hp);
	rate_remainHp[FIGHT_R]=(fighter[FIGHT_R].curHp / fighter[FIGHT_R].hp);
}

//draw left side
if(rate_remainHp[FIGHT_L]>0){
	if(rate_remainHp[FIGHT_L]>0.5)
		color_HpBar=c_green;
	else if(rate_remainHp[FIGHT_L]>0.25)
		color_HpBar=c_yellow;
	else
		color_HpBar=c_red;
	draw_set_color(color_HpBar);
	draw_rectangle(left_x[FIGHT_L],top_y
					,left_x[FIGHT_L]+rate_remainHp[FIGHT_L]*LEN_FULL_HP,bottom_y,false);
}
//draw right side
if(rate_remainHp[FIGHT_R]>0){
	if(rate_remainHp[FIGHT_R]>0.5)
		color_HpBar=c_green;
	else if(rate_remainHp[FIGHT_R]>0.25)
		color_HpBar=c_yellow;
	else
		color_HpBar=c_red;
	draw_set_color(color_HpBar);
	draw_rectangle(left_x[FIGHT_R],top_y
					,left_x[FIGHT_R]+rate_remainHp[FIGHT_R]*LEN_FULL_HP,bottom_y,false);
}