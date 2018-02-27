/// @description Insert description here
// You can write your code in this editor
draw_self();

var i=0;
var lineSpace=font_get_size(manager.ROOM_FONT)+2;
var role=manager.fighter[FIGHT_R];
var draw_x=x;
var draw_y=y;

draw_text(draw_x,draw_y+(i++)*lineSpace,"name  "+role.name);
draw_text(draw_x,draw_y+(i++)*lineSpace,"lv  "+string(role.lv)+"->"+string(role.lv+1));

var str;
str="maxHp  "+string(role.hp);
if(manager.lv_isAdd[INDEX_HP]) str+="->"+string(role.hp+manager.lv_isAdd[INDEX_HP]);
draw_text(draw_x,draw_y+(i++)*lineSpace,str);
str="atk  "+string(role.atk);
if(manager.lv_isAdd[INDEX_ATK]) str+="->"+string(role.hp+manager.lv_isAdd[INDEX_ATK]);
draw_text(draw_x,draw_y+(i++)*lineSpace,str);
str="def  "+string(role.def);
if(manager.lv_isAdd[INDEX_DEF]) str+="->"+string(role.hp+manager.lv_isAdd[INDEX_DEF]);
draw_text(draw_x,draw_y+(i++)*lineSpace,str);
str="dex  "+string(role.dex);
if(manager.lv_isAdd[INDEX_DEX]) str+="->"+string(role.hp+manager.lv_isAdd[INDEX_DEX]);
draw_text(draw_x,draw_y+(i++)*lineSpace,str);

	
