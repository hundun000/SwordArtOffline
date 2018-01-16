/// @description Insert description here
// You can write your code in this editor

var i;
var x_text=x;
var y_text=y;
var space=20;

var role=manager.selectedTeamRole;

draw_text(x_text,y_text+0*(font_get_size(global.font_CN_teamRoom)+space),+"名字:"+role.name);
draw_text(x_text,y_text+1*(font_get_size(global.font_CN_teamRoom)+space),+"生命值:"+string(role.hp));
draw_text(x_text,y_text+2*(font_get_size(global.font_CN_teamRoom)+space),+"攻击力:"+string(role.atk));
draw_text(x_text,y_text+3*(font_get_size(global.font_CN_teamRoom)+space),+"防御力:"+string(role.def));
draw_text(x_text,y_text+4*(font_get_size(global.font_CN_teamRoom)+space),+"敏捷值:"+string(role.dex));
