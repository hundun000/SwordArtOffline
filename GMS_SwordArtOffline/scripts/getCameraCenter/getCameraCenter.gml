/// @argument camera

var camera_x=camera_get_view_x(argument0);
var camera_y=camera_get_view_y(argument0);
var camera_w=camera_get_view_width(argument0);
var camera_h=camera_get_view_height(argument0);

var ans;
ans[0]=camera_x+camera_w*0.5;
ans[1]=camera_y+camera_h*0.5;
ans[2]=camera_w*0.25;

return ans;