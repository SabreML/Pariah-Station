/datum/species/skrell
	name = "\improper Skrell"
	plural_form = "Skrell"
	id = SPECIES_SKRELL
	//blood_color = "#1D2CBF" // Blood colours NYI
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_ORGANIC | BODYTYPE_SKRELL
	species_traits = list(MUTCOLORS, EYECOLOR, LIPS, HAS_FLESH, HAS_BONE)
	inherent_traits = list(
		TRAIT_ADVANCEDTOOLUSER,
		TRAIT_CAN_STRIP,
		TRAIT_CAN_USE_FLIGHT_POTION,
	)
	inherent_biotypes = MOB_ORGANIC | MOB_HUMANOID
	external_organs = list(/obj/item/organ/external/headtails = "Male")
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN | SLIME_EXTRACT
	liked_food = FRUIT | VEGETABLES
	disliked_food = MEAT | SEAFOOD
	meat = /obj/item/food/fishmeat // Actual skrell meat NYI
	payday_modifier = 0.75
	//species_language_holder = /datum/language_holder/skrell //TODO

	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/skrell,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/skrell,
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/skrell,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/skrell,
		BODY_ZONE_L_LEG = /obj/item/bodypart/l_leg/skrell,
		BODY_ZONE_R_LEG = /obj/item/bodypart/r_leg/skrell
	)

/datum/species/skrell/get_species_description()
	return "Temp"

/datum/species/skrell/get_species_lore()
	return list(
		"Temp"
	)
