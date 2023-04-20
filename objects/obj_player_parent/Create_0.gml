/// @description Init 

//Variables for the data this player needs during the game
deck = [];
discard = [];

deck_x = x + 200 * sign(image_xscale);
deck_y = y + 100;

discard_x = x + 200 * sign(image_xscale);
discard_y = y - 100;

play_x = x + 450 * sign(image_xscale);
play_y = y;

can_play = true;

lost = undefined;

//Put our info in the game manager and get our deck
obj_game.init_player(id);

shuffle_discard = function() {
	//Copy all cards from the discard into the deck, shuffle, and then erase the discard
	array_copy(deck, array_length(deck), discard, 0, array_length(discard));
	deck = array_shuffle(deck);
	discard = [];
}

end_of_round = function() {
	//Check if we've lost the game
	if (array_length(discard) == 0 && array_length(deck) == 0) {
		
		lost = true;
		//Set the other player to have won the game
		for(var i = 0; i < array_length(obj_game.players); ++i) {
			obj_game.players[i].lost ??= false;
		}
		
		obj_game.game_over();
		
		return;
	}
	
	//We're here so we haven't lost the game, so prep for the next round
	can_play = true;
	
	if (array_length(deck) == 0) {
		shuffle_discard();
	}
}

declare_war = function(offset) {
	var _deck_size = array_length(deck);
	var _cards_to_create = 3;
	
	//Check if we need to shuffle
	if (_deck_size < _cards_to_create && array_length(discard) > 0) {
		shuffle_discard();
		_deck_size = array_length(deck);
	}
	
	//If we're out of cards
	if (_deck_size == 0) {
		end_of_round();
		exit;
	}
	//We don't have enough for a full war, so adjust
	else if (_deck_size <= _cards_to_create) {
		_cards_to_create = _deck_size - 1;
	}
	
	var _war_x_offset = 1;
	
	//Draw the new battle card, too
	var _battle_card = instance_create_layer(deck_x, deck_y, "War_Cards", obj_card, {
		owner : id,
		goal_x : id.play_x + (offset * 30),
		goal_y : id.play_y,
	});
	
	audio_play_sound(snd_play_card, 1, false);
	
	//Sort based on depth
	_battle_card.depth = -_battle_card.goal_x;
	
	obj_game.add_card(_battle_card);
	
	repeat (_cards_to_create) {
		var _card = instance_create_layer(deck_x, deck_y, "War_Cards", obj_card, {
			owner : id,
			goal_x : id.play_x + (_war_x_offset * 64) - 95,
			goal_y : id.play_y + (offset * 64),
		});
		
		_card.in_war = true;
		_card.just_drawn = false;
		_card.battle_card = false;
			
		++_war_x_offset;
	}
	
	can_play = false;
}

draw_card = function() {
	audio_play_sound(snd_play_card, 1, false);
	
	var _card = instance_create_layer(deck_x, deck_y, "Battle_Cards", obj_card, {
		goal_x : play_x,
		goal_y : play_y,
		owner : id,
		battle_card : true,
	});
	
	obj_game.add_card(_card);
	
	can_play = false;
}