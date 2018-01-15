instance_destroy(obj_role_player);
var createX=0;
instance_create_layer(createX,0,0,obj_role_kirito);  createX+=64;
instance_create_layer(createX,0,0,obj_role_asuna);  createX+=64;
instance_create_layer(createX,0,0,obj_role_silica);  createX+=64;

global.asuna=instance_find(obj_role_asuna,0);
global.kirito=instance_find(obj_role_kirito,0);
global.silica=instance_find(obj_role_silica,0);

global.curWorldPos=0;
global.storyLine=0;
global.playerFrontTeam=ds_list_create();
global.playerWorldTeam=ds_list_create();

global.curNumPublicBoxItem=0;
global.publicBox=ds_grid_create(NUM_BOX_ITEM,NUM_ITEM_PROPERTY);

addRoleToWorld(global.kirito);

addItemToPublicBox("好伤药",8);
addItemToPublicBox("伤药",9);