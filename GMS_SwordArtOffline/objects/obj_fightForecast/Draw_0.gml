/// @description Insert description here
// You can write your code in this editor
draw_self();					
//------------- draw text -----------------
//index 0<=>left_side<=>enemy,1<=>right_side<=>player

draw_set_font(global.font_CN_fightForecast);
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


var weaponName;
weaponName=getRoleCurWeaponName(playerRole);
draw_text(text_left[1],y-1*text_top_space-90,weaponName);	
weaponName=getRoleCurWeaponName(enemyRole);
draw_text(text_left[0],y+4*text_top_space-90,weaponName);

draw_text(text_left[1],y-2*text_top_space-90,playerRole.name);
draw_text(text_left[0],y+5*text_top_space-90,enemyRole.name);

var photoSize=64;
var xscale;
var yscale;

var photoSprite=spr_playerRole_photo;
xscale=photoSize/sprite_get_width(photoSprite);
yscale=photoSize/sprite_get_height(photoSprite);
draw_sprite_ext(photoSprite,getPhotoIndexByName(playerRole.name),text_left[0],y-0.5*text_top_space-90,xscale,yscale,0,c_white,1);

var photoSprite=spr_enemyRole_photo;
xscale=photoSize/sprite_get_width(photoSprite);
yscale=photoSize/sprite_get_height(photoSprite);
draw_sprite_ext(photoSprite,getPhotoIndexByName(enemyRole.name),text_left[1],y+6.5*text_top_space-90,xscale,yscale,0,c_white,1);

