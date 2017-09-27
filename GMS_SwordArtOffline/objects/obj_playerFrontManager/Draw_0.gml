/// @description Insert description here



switch(cursorState){
	case CursorState.selectingEnemy:
	if(target!=noone){
		if(fightForecastInfo==noone){
			fightForecastInfo=getFightInfo(global.operatedRole,target,false);
		}
		
			draw_set_font(fightForecastFont);
			draw_set_color(c_black);
			//------------- draw board-------------------
			var center=getCameraCenter(view_camera[0]);
			var menuSide=sign(center[0]-global.cursor_pointer.x+1);

			var board_top=center[1];
			var board_left=center[0]+menuSide*center[2];

			draw_sprite(spr_fightForecastBoard,0
						,center[0]+menuSide*center[2],center[1]);
						
						
			//------------- draw text -----------------
			//index 0<=>left_side<=>enemy,1<=>right_side<=>player
			var text_left;
			text_left[0]=board_left+15-125;
			text_left[1]=board_left+165-125;
			var text_top_space=50;

			draw_text(text_left[0],board_top+0*text_top_space-90,target.curHp);
			draw_text(text_left[1],board_top+0*text_top_space-90,global.operatedRole.curHp);				
			for(var side=0;side<=1;side++){
				draw_text(text_left[side],board_top+1*text_top_space-90
							,string(fightForecastInfo[4+!side])+" X "+string(fightForecastInfo[0+!side]));
				draw_text(text_left[side],board_top+2*text_top_space-90,fightForecastInfo[2+!side]);
				draw_text(text_left[side],board_top+3*text_top_space-90,fightForecastInfo[6+!side]);					
						
		}
	}



}








