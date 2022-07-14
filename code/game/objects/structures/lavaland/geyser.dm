//If you look at the "geyser_soup" overlay icon_state, you'll see that the first frame has 25 ticks.
//That's because the first 18~ ticks are completely skipped for some ungodly weird fucking byond reason

///A lavaland geyser that spawns chems and can be mining scanned for points.
/obj/structure/geyser
	name = "geyser"
	icon = 'icons/obj/lavaland/terrain.dmi'
	icon_state = "geyser"
	anchored = TRUE

	///set to null to get it greyscaled from "[icon_state]_soup". Not very usable with the whole random thing, but more types can be added if you change the spawn prob
	var/erupting_state = null
	//whether we are active and generating chems
	var/activated = FALSE
	///what chem do we produce?
	var/reagent_id = /datum/reagent/fuel/oil
	///how much reagents we add every process (2 seconds)
	var/potency = 2
	///maximum volume
	var/max_volume = 500
	///how much we start with after getting activated
	var/start_volume = 50

	///Have we been discovered with a mining scanner?
	var/discovered = FALSE
	///How many points we grant to whoever discovers us
	var/point_value = 100
	///what's our real name that will show upon discovery? null to do nothing
	var/true_name
	///the message given when you discover this geyser.
	var/discovery_message = null

///start producing chems, should be called just once
/obj/structure/geyser/proc/start_chemming()
	activated = TRUE
	create_reagents(max_volume, DRAINABLE)
	reagents.add_reagent(reagent_id, start_volume)
	START_PROCESSING(SSfluids, src) //It's main function is to be plumbed, so use SSfluids
	if(erupting_state)
		icon_state = erupting_state
	else
		var/mutable_appearance/I = mutable_appearance('icons/obj/lavaland/terrain.dmi', "[icon_state]_soup")
		I.color = mix_color_from_reagents(reagents.reagent_list)
		add_overlay(I)

/obj/structure/geyser/process()
	if(activated && reagents.total_volume <= reagents.maximum_volume) //this is also evaluated in add_reagent, but from my understanding proc calls are expensive
		reagents.add_reagent(reagent_id, potency)

/obj/structure/geyser/plunger_act(obj/item/plunger/P, mob/living/user, _reinforced)
	if(!_reinforced)
		to_chat(user, span_warning("The [P.name] isn't strong enough!"))
		return
	if(activated)
		to_chat(user, span_warning("The [name] is already active!"))
		return

	to_chat(user, span_notice("You start vigorously plunging [src]!"))

/obj/structure/geyser/attackby(obj/item/item, mob/user, params)
	if(!istype(item, /obj/item/mining_scanner) && !istype(item, /obj/item/t_scanner/adv_mining_scanner))
		return ..() //this runs the plunger code

	if(discovered)
		to_chat(user, span_warning("This geyser has already been discovered!"))
		return

	to_chat(user, span_notice("You discovered the geyser and mark it on the GPS system!"))
	if(discovery_message)
		to_chat(user, discovery_message)

	discovered = TRUE
	if(true_name)
		name = true_name

	AddComponent(/datum/component/gps, true_name) //put it on the gps so miners can mark it and chemists can profit off of it

	if(isliving(user))
		var/mob/living/living = user

		var/obj/item/card/id/card = living.get_idcard()
		if(card)
			to_chat(user, span_notice("[point_value] mining points have been paid out!"))
			card.mining_points += point_value

/obj/structure/geyser/wittel
	reagent_id = /datum/reagent/wittel
	point_value = 250
	true_name = "wittel geyser"
	discovery_message = "It's a rare wittel geyser! This could be very powerful in the right hands... "

/obj/structure/geyser/plasma_oxide
	reagent_id = /datum/reagent/plasma_oxide
	true_name = "plasma-oxide geyser"

/obj/structure/geyser/protozine
	reagent_id = /datum/reagent/medicine/omnizine/protozine
	true_name = "protozine geyser"

/obj/structure/geyser/hollowwater
	reagent_id = /datum/reagent/water/hollowwater
	true_name = "hollow water geyser"

/obj/structure/geyser/random
	point_value = 500
	true_name = "strange geyser"
	discovery_message = "It's a strange geyser! How does any of this even work?" //it doesnt

/obj/structure/geyser/random/Initialize(mapload)
	. = ..()
	reagent_id = get_random_reagent_id()

///A funny
/obj/item/plunger
	name = "plunger"
	desc = "It's a plunger for plunging."
	icon = 'icons/obj/watercloset.dmi'
	icon_state = "plunger"
	worn_icon_state = "plunger"

	slot_flags = ITEM_SLOT_MASK
	flags_inv = HIDESNOUT

/obj/item/plunger/throw_impact(atom/hit_atom, datum/thrownthing/tt)
	. = ..()
	if(tt.target_zone != BODY_ZONE_HEAD)
		return
	if(iscarbon(hit_atom))
		var/mob/living/carbon/H = hit_atom
		if(!H.wear_mask)
			H.equip_to_slot_if_possible(src, ITEM_SLOT_MASK)
			H.visible_message(span_warning("The plunger slams into [H]'s face!"), span_warning("The plunger suctions to your face!"))
