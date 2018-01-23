/// @description Insert description here
// You can write your code in this editor

	
	
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
		draw_set_font(fightRoomFont_big);
		var str="lv "+string(fighter[FIGHT_R].lv)+" -> "+string(fighter[FIGHT_R].lv+1);
		draw_text(room_width/2-lvUp_width/2+2,i_y+2,str);
		if(lv_isAdd[INDEX_HP]>0)
			str="hp "+string(fighter[FIGHT_R].hp)+" -> "+string(fighter[FIGHT_R].hp+lv_isAdd[INDEX_HP]);
		else
			str="hp "+string(fighter[FIGHT_R].hp);	
		draw_text(room_width/2-lvUp_width/2+2,i_y+2+1*(font_get_size(fightRoomFont_big)+2),str);
		if(lv_isAdd[INDEX_ATK]>0)
			str="atk "+string(fighter[FIGHT_R].atk)+" -> "+string(fighter[FIGHT_R].atk+lv_isAdd[INDEX_ATK]);
		else
			str="atk "+string(fighter[FIGHT_R].atk);	
		draw_text(room_width/2-lvUp_width/2+2,i_y+2+2*(font_get_size(fightRoomFont_big)+2),str);
		if(lv_isAdd[INDEX_DEF]>0)
			str="def "+string(fighter[FIGHT_R].def)+" -> "+string(fighter[FIGHT_R].def+lv_isAdd[INDEX_DEF]);
		else
			str="def "+string(fighter[FIGHT_R].atk);	
		draw_text(room_width/2-lvUp_width/2+2,i_y+2+3*(font_get_size(fightRoomFont_big)+2),str);
		if(lv_isAdd[INDEX_DEX]>0)
			str="dex "+string(fighter[FIGHT_R].dex)+" -> "+string(fighter[FIGHT_R].dex+lv_isAdd[INDEX_DEX]);
		else
			str="dex "+string(fighter[FIGHT_R].atk);	
		draw_text(room_width/2-lvUp_width/2+2,i_y+2+4*(font_get_size(fightRoomFont_big)+2),str);
		
	}
}
