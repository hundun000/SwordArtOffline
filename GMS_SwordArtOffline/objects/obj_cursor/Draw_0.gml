/// @description Insert description here

draw_self();



switch(cursorstate){
	case CursorState.selectingEnemy:
	if(target!=noone){
		if(fightForecastInfo==noone){
			fightForecastInfo=getFightInfo(global.operatedRole,target);
		}
		else{
			//------------- draw board-------------------
			var center=getCameraCenter(view_camera[0]);
			var menuSide=sign(center[0]-x+1);

			show_debug_message(string(center[0])+string(center[1])+string(center[2]));

			draw_sprite(spr_fightForecastBoard,0
						,center[0]+menuSide*center[2],center[1]);
		}
	}



}
