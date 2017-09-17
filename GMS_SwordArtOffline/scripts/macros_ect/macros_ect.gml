#macro UNIT 64




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