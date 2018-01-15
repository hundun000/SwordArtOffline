/// @description Insert description here
// You can write your code in this editor
draw_self();					
//------------- draw text -----------------
//index 0<=>left_side<=>enemy,1<=>right_side<=>player

draw_set_font(fightForecastFont);
draw_set_color(c_black);

var text_left;
text_left[0]=x-110;
text_left[1]=x+40;
var text_top_space=50;

draw_text(text_left[0],y+0*text_top_space-90,enemyRole.curHp);
draw_text(text_left[1],y+0*text_top_space-90,playerRole.curHp);				
for(var side=0;side<=1;side++){
	draw_text(text_left[side],y+1*text_top_space-90
				,string(fightForecastInfo[4+!side])+" X "+string(fightForecastInfo[0+!side]));
	draw_text(text_left[side],y+2*text_top_space-90,fightForecastInfo[2+!side]);
	draw_text(text_left[side],y+3*text_top_space-90,fightForecastInfo[6+!side]);					
}
