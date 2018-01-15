/// @description Insert description here
// You can write your code in this editor
var center=getCameraCenter(view_camera[0]);
var menuSide=sign(center[0]-global.cursor_pointer.x+1);
x=center[0]+menuSide*center[2];
y=center[1];