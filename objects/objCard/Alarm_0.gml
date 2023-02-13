/// @description Compare the two cards 

if (owner == obj_war_player && active) {

	var _player_card = instance_nearest(room_width / 2, room_height / 1.5, objCard);
	var _enemy_card = instance_nearest(room_width / 2, room_height / 3, objCard);
	
	//Won the war
	if (_player_card.value > _enemy_card.value) {
		//Move to the player's discard
		with(_player_card) {
			move_towards_point(obj_war_player.x, obj_war_player.y, 8);
			direction = point_direction(x, y, obj_war_player.discard.x, obj_war_player.discard.y);
			active = false;
		}
		with(_enemy_card) {
			owner = obj_war_player;
			move_towards_point(obj_war_player.y, obj_war_player.y, 8);
			direction = point_direction(x, y, obj_war_player.discard.x, obj_war_player.discard.y);
			active = false;
		}
	}
	//Lost the war
	else if (_player_card.value < _enemy_card.value) {
		//Move to the enemy discard
		with(_player_card) {
			owner = obj_war_enemy;
			move_towards_point(obj_war_enemy.x, obj_war_enemy.y, 8);
			direction = point_direction(x, y, obj_war_enemy.discard.x, obj_war_enemy.discard.y);
			active = false;
		}
		with(_enemy_card) {
			move_towards_point(obj_war_enemy.y, obj_war_enemy.y, 8);
			direction = point_direction(x, y, obj_war_enemy.discard.x, obj_war_enemy.discard.y);
			active = false;
		}
	}
	//Tied
	else {
		//Go to war
		layer_sequence_create("Instances", room_width / 2, room_height / 2, seqWar);
	}
	
	//layer_sequence_create("Instances", room_width / 2, room_height / 2, seqExplosion);
}

