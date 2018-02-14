/// @description Insert description here
// You can write your code in this editor

#macro HOME_GOTO_MAP 0
#macro HOME_EDIT_TEAM_MENBER 1
#macro HOME_EDIT_TEAM_LAYUOT 2
#macro HOME_SAVE 3
#macro HOME_LOAD 4


menuOption=ds_list_create();
ds_list_set(menuOption,HOME_GOTO_MAP,"launch");
ds_list_set(menuOption,HOME_EDIT_TEAM_MENBER,"edit menber");
ds_list_set(menuOption,HOME_EDIT_TEAM_LAYUOT,"edit layout");
ds_list_set(menuOption,HOME_SAVE,"save game");
ds_list_set(menuOption,HOME_LOAD,"load game");
num_option=ds_list_size(menuOption);

#macro MATE_POS 0
homeMateIndex=-1;