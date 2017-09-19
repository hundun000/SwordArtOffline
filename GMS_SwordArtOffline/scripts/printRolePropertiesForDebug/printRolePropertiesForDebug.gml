/// @argument0 role

var role=argument0;
var properties=getRoleProperties(role.name,role.lv);

show_debug_message("Role message:");
show_debug_message("name:");
show_debug_message(argument0.name);
show_debug_message("hp:");
show_debug_message(properties[INDEX_HP]);

