/// @description End of the Game

with(obj_player) {
	if (player_id == 0) {
		//The first player is out of cards and loses
		if (array_length(deck) == 0 and other.can_draw) {
			can_draw = false;
			audio_stop_all();
			music = audio_play_sound(snd_lost_game, 1, false);
			//Start an alarm to restart the game that's the length of the music
			other.alarm[0] = audio_sound_length(music) * 60;
		}
	}
	//The second player is out of cards and loses
	else {
		if (array_length(deck) == 0 and other.can_draw) {
			can_draw = false;
			audio_stop_all();
			music = audio_play_sound(snd_won_game, 1, false);
			//Start an alarm to restart the game that's the length of the music
			other.alarm[0] = audio_sound_length(music) * 60;
		}
	}
}