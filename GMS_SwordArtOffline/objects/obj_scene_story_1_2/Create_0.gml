/// @description Insert description here
// You can write your code in this editor

//bgm=audio_play_sound(s_map0_bgm,1,1);


event_inherited();


addSceneDelay(20);

addSceneMovement("kirito",1,3,4);
addSceneTextBox("kirito","你这边也解决了？",0);
addSceneTextBox("klein","是的，谢谢，看来我学会了战斗技巧。",1);
addSceneTextBox("kirito","噢，我得下线了。",0);
addSceneTextBox("klein","我也是。",1);
addSceneTextBox("kirito","那么……等等，为什么没有登出键？",0);
addSceneTextBox("klein","我也没找到，为什么会变成这样？",1);
addSceneTextBox("kirito","看，系统提示我们到中央广场集合。",0);
addSceneTextBox("klein","看来我们能在那里得到解释。",1);

addSceneChangeRoom(room_home,InputReceiver.HOME);
