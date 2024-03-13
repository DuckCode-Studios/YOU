function randomize_tier(chance) {
	//Sorting tier card
	var tierCard = -1
			
	for (var j = 1; j <= ds_map_size(global.tiers); j++) {
		var tier = ds_map_find_value(global.tiers, j);
		
		if (tier.chance >= chance || j ==  ds_map_size(global.tiers)) {
			tierCard = tier
			break;
		}
	}
	
	return tierCard
}

function randomize_cards() {
	var cards = ds_map_create()
	var sortedNumbers = ds_list_create()
	
	if (variable_global_exists("all_skills") && variable_global_exists("tiers") 
		&& variable_global_exists("silverCards") 
		&& variable_global_exists("goldCards") 
		&& variable_global_exists("diamondCards")) {
		
		for (var i = 0; i < 3; i++) {
			
			randomize()
			
			var chance = irandom(100)
			var listCards = ds_list_create()

			//Randomizing the card tier
			var tier = randomize_tier(chance)

			if (tier.cardId == 1) {
				//Diamond
				listCards = global.diamondCards
			} else if (tier.cardId == 2) {
				//Gold
				listCards = global.goldCards
			} else {
				//Silver
				listCards = global.silverCards
			}

			var pos = irandom(ds_list_size(listCards) - 1)
			var idCard = ds_list_find_value(listCards, pos)
			
			while (ds_list_find_index(sortedNumbers ,idCard) != -1) {
				
				pos = irandom(ds_list_size(listCards) - 1)
				idCard = ds_list_find_value(listCards, pos)
				
			}
			
			
			ds_list_add(sortedNumbers, idCard)
			
			var skill = ds_map_find_value(global.all_skills, idCard)
			
			ds_map_add(cards, skill.skillId, skill)
		}
	}
	
	var arr = []
	ds_map_values_to_array(cards, arr)
	
	return arr;

}