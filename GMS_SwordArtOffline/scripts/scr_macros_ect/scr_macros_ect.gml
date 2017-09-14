#macro UNIT 64
#macro BTN_A ord("Z")
#macro BTN_B ord("X")
#macro BTN_U vk_up
#macro BTN_D vk_down
#macro BTN_L vk_left
#macro BTN_R vk_right



enum RoleState{
	idle,
	selected,
	gray
}

enum CursorState{
	free,
	selectedRole
}

enum RoleType{
	walker
}

enum controlType{
	player
}