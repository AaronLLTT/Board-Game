/// @description Compare Cards 

//Check for win / loss
if (array_length(obj_player.deck) == 0 and can_draw) {
	//The player loses
	can_draw = false;
	audio_stop_all();
	music = audio_play_sound(snd_lost_game, 1, false);
	alarm[0] = audio_sound_length(music) * 60;
}
if (array_length(obj_computer.deck) == 0 and can_draw) {
	//The player loses
	can_draw = false;
	audio_stop_all();
	music = audio_play_sound(snd_won_game, 1, false);
	alarm[0] = audio_sound_length(music) * 60;
}