/// @description Insert description here
// You can write your code in this editor


	var top_y=145;
	var bottom_y=150;
	var left_x;
	left_x[FIGHT_L]=32;
	left_x[FIGHT_R]=150;

	var message_top_y=109;
	var message_left_x;
	message_left_x[FIGHT_L]=18;
	message_left_x[FIGHT_R]=218;
	
	var name_top_y=10;
	var name_left_x;
	name_left_x[FIGHT_L]=5;
	name_left_x[FIGHT_R]=195;	
	
	
	var rate_remainHp;
	var num_remainHp;
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
			
	num_remainHp[global.curAttackSide]=fighter[global.curAttackSide].curHp; 
	num_remainHp[!global.curAttackSide]=(fighter[!global.curAttackSide].curHp-actulDamage) ;		
}
else{
    
	num_remainHp[FIGHT_L]=fighter[FIGHT_L].curHp;
	num_remainHp[FIGHT_R]=fighter[FIGHT_R].curHp;
}

rate_remainHp[FIGHT_L]=num_remainHp[FIGHT_L]/fighter[FIGHT_L].hp; 
rate_remainHp[FIGHT_R]=num_remainHp[FIGHT_R]/fighter[FIGHT_R].hp; 




var side=FIGHT_L;
//let two side use the same codes by the two-times loop
for(var i=0;i<2;i++){

	//***************draw name**********************
	draw_set_font(fightRoomFont_mid);
	draw_set_color(c_black);
	draw_text(name_left_x[side],name_top_y,fighter[side].name);

	//***************draw fight message**********************
	draw_set_font(fightRoomFont_small);
	draw_text(message_left_x[side],message_top_y,hitRate[side]);
	draw_text(message_left_x[side],message_top_y+font_get_size(fightRoomFont_small)+1,preDamage[side]);
	draw_text(message_left_x[side],message_top_y+font_get_size(fightRoomFont_small)*2+2,criticalRate[side]);
	


	//***************draw Hp text and Hp bar**********************
	draw_set_font(fightRoomFont_mid);
	if(rate_remainHp[side]>0.5)
		color_HpBar=c_green;
	else if(rate_remainHp[side]>0.25)
		color_HpBar=c_yellow;
	else
		color_HpBar=c_red;
	draw_set_color(color_HpBar);
	if(rate_remainHp[side]>0){//hp==0 maybe draw sa 1,so skip 0's case
		draw_rectangle(left_x[side],top_y
						,left_x[side]+rate_remainHp[side]*LEN_FULL_HP,bottom_y,false);			
	}
	draw_text(left_x[side]-20,top_y-5,num_remainHp[side]);
	
	//toggle side
	side=!side;
}




//********draw Xp image**********
if(waitAddXp>=0){
	//bar
	var xp_bar_y=room_height/2;
	draw_sprite(spr_xpBar,0,room_width/2,xp_bar_y);
	//xp
	var xp_full_width=131;
	var xp_width=fighter[FIGHT_R].xp/100*xp_full_width;
	var xp_height=8;
	var xp_top_y=xp_bar_y-xp_height/2;
	var xp_left_x=room_width/2-81;
	draw_set_color(c_orange);
	draw_rectangle(xp_left_x,xp_top_y,xp_left_x+xp_width,xp_top_y+xp_height,false);
	//number
	draw_set_font(fightRoomFont_mid);
	draw_text(xp_left_x+xp_full_width+1,xp_top_y-4,fighter[FIGHT_R].xp);
	//lv up
	if(flag_lv_up){
		draw_sprite(spr_xpBar,1,room_width/2,xp_bar_y);
	}
			
}	
	
//********draw if lv up image**********
if(waitAddXp==0&&flag_lv_up){
//Xp add finish ,no long draw Xp ,maybe draw lv up 
	if(flag_lv_up){
		var lvUp_width=100;
		var lvUp_height=100;
		draw_set_color(c_white);
		draw_rectangle(room_width/2-lvUp_width/2,room_height/2-lvUp_height/2
			,room_width/2+lvUp_width/2,room_height/2+lvUp_height/2,false);
				
		var i_y=room_height/2-lvUp_height/2;
		draw_set_color(c_black);
		draw_set_font(fightRoomFont_small);
		var str="lv "+string(fighter[FIGHT_R].lv)+" -> "+string(fighter[FIGHT_R].lv+1);
		draw_text(room_width/2-lvUp_width/2+2,i_y+2,str);
		
	}
}
