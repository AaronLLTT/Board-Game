/// @description Create / Join a game

rollback_define_player(obj_player);

rollback_use_random_input(false);

rollback_define_mock_input(1, {
	space : vk_enter
});

var _joined = rollback_join_game();

if (!_joined) {
	rollback_create_game(2, true);
}