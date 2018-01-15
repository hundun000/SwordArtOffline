/// @description Insert description here
// You can write your code in this editor

#macro HOME_GOTO_MAP 0
#macro HOME_EDIT_TEAM 1
#macro HOME_SAVE 2
#macro HOME_LOAD 3


menuOption=ds_list_create();
ds_list_set(menuOption,HOME_GOTO_MAP,"weigh anchor");
ds_list_set(menuOption,HOME_EDIT_TEAM,"edit team");
ds_list_set(menuOption,HOME_SAVE,"save game");
ds_list_set(menuOption,HOME_LOAD,"load game");
num_option=ds_list_size(menuOption);