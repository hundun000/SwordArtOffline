/// @description Insert description here
// You can write your code in this editor
draw_self();					
//------------- draw text -----------------
//index 0<=>left_side<=>enemy,1<=>right_side<=>player

draw_set_font(global.font_CN_fightForecast);
draw_set_color(c_black);

var left_skillRole=x-110;
var top_skillRole=y-110;
var left_targetRole=x-10;
var top_targetRole=y-30;

var text_left_current=x-110;
var text_left_strengthen=x;
var text_left_delta=x+50;
var text_top_values=y-10;
var text_top_space=50;


var curValues;
curValues[0]=targetRole.curHp;
curValues[1]=targetRole.atk;
curValues[2]=targetRole.def;
curValues[3]=targetRole.dex;

var i;
var string_sign;
string_sign[1]="+";
string_sign[0]="-";

var strengthenValue;

for(i=0;i<4;i++){
	if(i==0)
		strengthenValue[i]=clamp(curValues[i]+strengthenForecastInfo[i],0,targetRole.hp);
	else	
		strengthenValue[i]=curValues[i]+strengthenForecastInfo[i]; if(strengthenValue[i]<0) strengthenValue[i]=0;
	
	draw_text(text_left_current,text_top_values+i*text_top_space,curValues[i]);
	draw_text(text_left_strengthen,text_top_values+i*text_top_space,strengthenValue[i]);
	draw_text(text_left_delta,text_top_values+i*text_top_space,string_sign[sign(strengthenValue[i]-curValues[i]+0.1)]+string(strengthenValue[i]-curValues[i]));
}

var photoSize=64;
var xscale;
var yscale;

var photoSprite=spr_playerRole_photo;
xscale=photoSize/sprite_get_width(photoSprite);
yscale=photoSize/sprite_get_height(photoSprite);
draw_sprite_ext(photoSprite,getPhotoIndexByName(skillRole.name),left_skillRole,top_skillRole,xscale,yscale,0,c_white,1);
draw_sprite_ext(photoSprite,getPhotoIndexByName(targetRole.name),left_targetRole,top_targetRole,xscale,yscale,0,c_white,1);

var left_skillSprite=left_skillRole+photoSize+10;
var skillIns=getItemInstanceByName(skillRole.skillName);
var skillSprite=skillIns.sprite_index;
draw_sprite(skillSprite,0,left_skillSprite,top_skillRole-photoSize);


var left_text_skillRoleName=left_skillSprite+UNIT+10;
var left_text_targrtRoleName=left_targetRole+photoSize+10;
draw_text(left_text_skillRoleName,top_skillRole-photoSize,skillRole.name);
draw_text(left_text_targrtRoleName,top_targetRole-photoSize,targetRole.name);

var top_text_skillName=top_skillRole-30;
draw_text(left_text_skillRoleName,top_text_skillName,skillRole.skillName);
