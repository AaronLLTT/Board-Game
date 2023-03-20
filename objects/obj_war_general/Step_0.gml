/// @description End of the Game

//The player is out of cards and loses
if (array_length(obj_player.deck) == 0 and can_draw) {
	can_draw = false;
	audio_stop_all();
	music = audio_play_sound(snd_lost_game, 1, false);
	//Start an alarm to restart the game that's the length of the music
	alarm[0] = audio_sound_length(music) * 60;
}
//The computer is out of cards and loses
if (array_length(obj_computer.deck) == 0 and can_draw) {
	can_draw = false;
	audio_stop_all();
	music = audio_play_sound(snd_won_game, 1, false);
	//Start an alarm to restart the game that's the length of the music
	alarm[0] = audio_sound_length(music) * 60;
}