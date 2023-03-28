/// @description Create / Join a game

create_game = function() {
	rollback_define_player(obj_player);

	//rollback_use_random_input(false);

	var _joined = rollback_join_game();

	if (!_joined) {
		rollback_create_game(2, false);
	}
}