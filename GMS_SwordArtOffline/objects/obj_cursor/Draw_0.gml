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

draw_set_color(c_black);
if(debug_mode)
for(var xx=0;xx<room_width;xx+=64)
	for(var yy=16;yy<room_width;yy+=64)
		draw_text(xx,yy,"("+string(xx/64)+","+string((yy-16)/64)+")");






