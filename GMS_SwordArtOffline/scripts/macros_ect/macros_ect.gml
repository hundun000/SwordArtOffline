#macro UNIT 64
#macro VIEW_WIDTH 640
#macro VIEW_HEIGHT 448

#macro NUM_DOMORE_OPTION 5
#macro OPTION_FIGHT 0
#macro OPTION_BAG 1
#macro OPTION_TALK 3
#macro OPTION_END 4


#macro NUM_ROLE_ITEM 3
#macro NUM_BOX_ITEM 6
#macro NUM_ITEM_PROPERTY 3


#macro INDEX_ITEM_NAME 0
#macro INDEX_ITEM_QUALITY 1

#macro DEPTH_ROLE 500
#macro DEPTH_FIGHT_FORECAST 200

#macro INDEX_HP 0
#macro INDEX_ATK 1
#macro INDEX_DEF 2
#macro INDEX_DEX 3
#macro INDEX_XP 4

enum Weapon{
	sword
}


enum RoleState{
	idle,
	selected,
	doMore,
	gray
}



enum RoleType{
	walker
}

enum ControlType{
	player,
	enemy
}