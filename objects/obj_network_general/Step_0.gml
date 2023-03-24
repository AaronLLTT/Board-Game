/// @description Spawn General

if (room == rm_war && !instance_exists(obj_war_general) && instance_exists(obj_player)) {
	instance_create_layer(0, 0, "Instances", obj_war_general);
}