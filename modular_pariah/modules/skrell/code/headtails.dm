/obj/item/organ/external/headtails
	zone = BODY_ZONE_HEAD
	slot = ORGAN_SLOT_EXTERNAL_HEADTAILS
	layers = EXTERNAL_BEHIND // TODO: figure out later

	feature_key = "headtails"
	preference = "feature_skrell_headtails"

	dna_block = DNA_SKRELL_HEADTAILS_BLOCK

/obj/item/organ/external/headtails/can_draw_on_bodypart(mob/living/carbon/human/human)
	if((human.head?.flags_inv & HIDEHAIR) || (human.wear_mask?.flags_inv & HIDEHAIR))
		return FALSE
	return TRUE

/obj/item/organ/external/headtails/get_global_feature_list()
	return GLOB.skrell_headtails_list
