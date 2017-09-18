#macro UNIT 64
#macro VIEW_WIDTH 640
#macro VIEW_HEIGHT 448

#macro NUM_DOMORE_OPTION 5
#macro OPTION_FIGHT 0


enum Weapon{
	sword
}


enum RoleState{
	idle,
	selected,
	doMore,
	gray
}

enum CursorState{
	free,
	selectedRole,
	roleDoMore,
	selectingEnemy,
	moved
}

enum RoleType{
	walker
}

enum controlType{
	player
}