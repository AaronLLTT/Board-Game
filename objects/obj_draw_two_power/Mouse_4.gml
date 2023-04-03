/// @description 


if (image_index == 0) {
	++image_index;
	owner.using_power = true;
	//Check there's enough cards left
	if (array_length(owner.deck) <= 1) {
		array_copy(owner.deck, 1, owner.discard, 0, array_length(owner.discard));
		//owner.shuffle_discard();
		if (array_length(owner.deck) <= 1) {
			owner.using_power = false;
			image_index = 0;
		}
	}
}
else if (image_index == 1) {
	--image_index;
	owner.using_power = false;
}