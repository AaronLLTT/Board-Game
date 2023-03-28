/// @description Create / Join a game

//Check if we're joining a game
rollback_define_player(obj_player);

rollback_join_game();

create_game = function(_player_count) {
	instance_destroy(obj_player_select_button);

	rollback_create_game(_player_count, false);
}