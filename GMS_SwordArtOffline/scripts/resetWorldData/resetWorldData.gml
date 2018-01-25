instance_destroy(obj_instanceManager);
instance_create_depth(0,0,0,obj_instanceManager);

global.thisGame.worldMapManager.curWorldPos=0;
global.thisGame.worldMapManager.storyLine=0;

global.playerFrontTeam=ds_list_create();
global.playerWorldTeam=ds_list_create();

global.curNumPublicBoxItem=0;
global.publicBox=ds_grid_create(NUM_BOX_ITEM,NUM_ITEM_PROPERTY);

var role;
role=getRoleByName("kirito");
addRoleToWorld(role);

addItemToPublicBox("好伤药",8);
addItemToPublicBox("伤药",9);