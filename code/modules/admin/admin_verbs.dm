//admin verb groups - They can overlap if you so wish. Only one of each verb will exist in the verbs list regardless
//the procs are cause you can't put the comments in the GLOB var define
GLOBAL_LIST_INIT(admin_verbs_default, world.AVerbsDefault())
GLOBAL_PROTECT(admin_verbs_default)
/world/proc/AVerbsDefault()
	return list(
	TYPE_PROC_REF(/client, deadmin), /*destroys our own admin datum so we can play as a regular player*/
	TYPE_PROC_REF(/client, cmd_admin_say), /*admin-only ooc chat*/
	TYPE_PROC_REF(/client, cmd_loud_admin_say), /*ditto except its annoying - PARIAH EDIT ADDITION - ADMIN*/
	TYPE_PROC_REF(/client, hide_verbs), /*hides all our adminverbs*/
	TYPE_PROC_REF(/client, debug_variables), /*allows us to -see- the variables of any instance in the game. +VAREDIT needed to modify*/
	TYPE_PROC_REF(/client, dsay), /*talk in deadchat using our ckey/fakekey*/
	TYPE_PROC_REF(/client, investigate_show), /*various admintools for investigation. Such as a singulo grief-log*/
	TYPE_PROC_REF(/client, secrets),
	TYPE_PROC_REF(/client, reload_admins),
	TYPE_PROC_REF(/client, reestablish_db_connection), /*reattempt a connection to the database*/
	TYPE_PROC_REF(/client, cmd_admin_pm_context), /*right-click adminPM interface*/
	TYPE_PROC_REF(/client, cmd_admin_pm_panel), /*admin-pm list*/
	TYPE_PROC_REF(/client, stop_sounds),
	TYPE_PROC_REF(/client, mark_datum_mapview),
	TYPE_PROC_REF(/client, tag_datum_mapview),
	TYPE_PROC_REF(/client, debugstatpanel),
	TYPE_PROC_REF(/client, fix_air), /*resets air in designated radius to its default atmos composition*/
	TYPE_PROC_REF(/client, requests)
	)
GLOBAL_LIST_INIT(admin_verbs_admin, world.AVerbsAdmin())
GLOBAL_PROTECT(admin_verbs_admin)
/world/proc/AVerbsAdmin()
	return list(
	TYPE_PROC_REF(/client, invisimin), /*allows our mob to go invisible/visible*/
// TYPE_PROC_REF(/datum/admins, show_traitor_panel), /*interface which shows a mob's mind*/ -Removed due to rare practical use. Moved to debug verbs ~Errorage
	TYPE_PROC_REF(/datum/admins, show_lag_switch_panel),
	/datum/admins/proc/show_player_panel, /*shows an interface for individual players, with various links (links require additional flags*/
	/datum/verbs/menu/Admin/verb/playerpanel,
	TYPE_PROC_REF(/client, game_panel), /*game panel, allows to change game-mode etc*/
	TYPE_PROC_REF(/client, check_ai_laws), /*shows AI and borg laws*/
	TYPE_PROC_REF(/client, ghost_pool_protection), /*opens a menu for toggling ghost roles*/
	TYPE_PROC_REF(/datum/admins, toggleooc), /*toggles ooc on/off for everyone*/
	TYPE_PROC_REF(/datum/admins, togglelooc), /*toggles looc on/off for everyone*/
	TYPE_PROC_REF(/datum/admins, toggleoocdead), /*toggles ooc on/off for everyone who is dead*/
	TYPE_PROC_REF(/datum/admins, toggleenter), /*toggles whether people can join the current game*/
	TYPE_PROC_REF(/datum/admins, toggleguests), /*toggles whether guests can join the current game*/
	TYPE_PROC_REF(/datum/admins, announce), /*priority announce something to all clients.*/
	TYPE_PROC_REF(/datum/admins, set_admin_notice), /*announcement all clients see when joining the server.*/
	TYPE_PROC_REF(/client, admin_ghost), /*allows us to ghost/reenter body at will*/
	TYPE_PROC_REF(/client, toggle_view_range), /*changes how far we can see*/
	TYPE_PROC_REF(/client, getserverlogs), /*for accessing server logs*/
	TYPE_PROC_REF(/client, getcurrentlogs), /*for accessing server logs for the current round*/
	TYPE_PROC_REF(/client, cmd_admin_subtle_message), /*send a message to somebody as a 'voice in their head'*/
	TYPE_PROC_REF(/client, cmd_admin_headset_message), /*send a message to somebody through their headset as CentCom*/
	TYPE_PROC_REF(/client, cmd_admin_delete), /*delete an instance/object/mob/etc*/
	TYPE_PROC_REF(/client, cmd_admin_check_contents), /*displays the contents of an instance*/
	TYPE_PROC_REF(/client, centcom_podlauncher),/*Open a window to launch a Supplypod and configure it or it's contents*/
	TYPE_PROC_REF(/client, check_antagonists), /*shows all antags*/
	TYPE_PROC_REF(/datum/admins, access_news_network), /*allows access of newscasters*/
	TYPE_PROC_REF(/client, jumptocoord), /*we ghost and jump to a coordinate*/
	TYPE_PROC_REF(/client, Getmob), /*teleports a mob to our location*/
	TYPE_PROC_REF(/client, Getkey), /*teleports a mob with a certain ckey to our location*/
// TYPE_PROC_REF(/client, sendmob), /*sends a mob somewhere*/ -Removed due to it needing two sorting procs to work, which were executed every time an admin right-clicked. ~Errorage
	TYPE_PROC_REF(/client, jumptoarea),
	TYPE_PROC_REF(/client, jumptokey), /*allows us to jump to the location of a mob with a certain ckey*/
	TYPE_PROC_REF(/client, jumptomob), /*allows us to jump to a specific mob*/
	TYPE_PROC_REF(/client, jumptoturf), /*allows us to jump to a specific turf*/
	TYPE_PROC_REF(/client, admin_call_shuttle), /*allows us to call the emergency shuttle*/
	TYPE_PROC_REF(/client, admin_cancel_shuttle), /*allows us to cancel the emergency shuttle, sending it back to centcom*/
	TYPE_PROC_REF(/client, admin_disable_shuttle), /*allows us to disable the emergency shuttle admin-wise so that it cannot be called*/
	TYPE_PROC_REF(/client, admin_enable_shuttle),  /*undoes the above*/
	TYPE_PROC_REF(/client, cmd_admin_direct_narrate), /*send text directly to a player with no padding. Useful for narratives and fluff-text*/
	TYPE_PROC_REF(/client, cmd_admin_world_narrate), /*sends text to all players with no padding*/
	TYPE_PROC_REF(/client, cmd_admin_local_narrate), /*sends text to all mobs within view of atom*/
	TYPE_PROC_REF(/client, cmd_admin_create_centcom_report),
	TYPE_PROC_REF(/client, cmd_change_command_name),
	TYPE_PROC_REF(/client, cmd_admin_check_player_exp), /* shows players by playtime */
	TYPE_PROC_REF(/client, toggle_combo_hud), // toggle display of the combination pizza antag and taco sci/med/eng hud
	TYPE_PROC_REF(/client, toggle_AI_interact), /*toggle admin ability to interact with machines as an AI*/
	TYPE_PROC_REF(/datum/admins, open_shuttlepanel), /* Opens shuttle manipulator UI */
	TYPE_PROC_REF(/client, respawn_character),
	TYPE_PROC_REF(/datum/admins, open_borgopanel),
	TYPE_PROC_REF(/datum/admins, view_all_circuits),
	TYPE_PROC_REF(/datum/admins, view_all_sdql_spells),
	TYPE_PROC_REF(/datum/admins, known_alts_panel),
	TYPE_PROC_REF(/datum/admins, paintings_manager),
	TYPE_PROC_REF(/datum/admins, display_tags),
	)
GLOBAL_LIST_INIT(admin_verbs_ban, list(TYPE_PROC_REF(/client, unban_panel), TYPE_PROC_REF(/client, ban_panel), TYPE_PROC_REF(/client, stickybanpanel)))
GLOBAL_PROTECT(admin_verbs_ban)
GLOBAL_LIST_INIT(admin_verbs_sounds, list(TYPE_PROC_REF(/client, play_local_sound), TYPE_PROC_REF(/client, play_direct_mob_sound), TYPE_PROC_REF(/client, play_sound), TYPE_PROC_REF(/client, set_round_end_sound)))
GLOBAL_PROTECT(admin_verbs_sounds)
GLOBAL_LIST_INIT(admin_verbs_fun, list(
	TYPE_PROC_REF(/client, cmd_select_equipment),
	TYPE_PROC_REF(/client, cmd_admin_gib_self),
	TYPE_PROC_REF(/client, drop_bomb),
	TYPE_PROC_REF(/client, set_dynex_scale),
	TYPE_PROC_REF(/client, drop_dynex_bomb),
	TYPE_PROC_REF(/client, cinematic),
	TYPE_PROC_REF(/client, summon_ert),
	TYPE_PROC_REF(/client, cmd_admin_add_freeform_ai_law),
	TYPE_PROC_REF(/client, object_say),
	TYPE_PROC_REF(/client, toggle_random_events),
	TYPE_PROC_REF(/client, set_ooc),
	TYPE_PROC_REF(/client, reset_ooc),
	TYPE_PROC_REF(/client, forceEvent),
	TYPE_PROC_REF(/client, admin_change_sec_level),
	TYPE_PROC_REF(/client, toggle_nuke),
	TYPE_PROC_REF(/client, run_weather),
	TYPE_PROC_REF(/client, mass_zombie_infection),
	TYPE_PROC_REF(/client, mass_zombie_cure),
	TYPE_PROC_REF(/client, polymorph_all),
	TYPE_PROC_REF(/client, show_tip),
	TYPE_PROC_REF(/client, smite),
	TYPE_PROC_REF(/client, admin_away),
	TYPE_PROC_REF(/client, add_mob_ability),
	TYPE_PROC_REF(/datum/admins, station_traits_panel),
	))
GLOBAL_PROTECT(admin_verbs_fun)
GLOBAL_LIST_INIT(admin_verbs_spawn, list(TYPE_PROC_REF(/datum/admins, spawn_atom), TYPE_PROC_REF(/datum/admins, podspawn_atom), TYPE_PROC_REF(/datum/admins, spawn_cargo), TYPE_PROC_REF(/datum/admins, spawn_objasmob), TYPE_PROC_REF(/client, respawn_character), TYPE_PROC_REF(/datum/admins, beaker_panel)))
GLOBAL_PROTECT(admin_verbs_spawn)
GLOBAL_LIST_INIT(admin_verbs_server, world.AVerbsServer())
GLOBAL_PROTECT(admin_verbs_server)
/world/proc/AVerbsServer()
	return list(
	TYPE_PROC_REF(/datum/admins, startnow),
	TYPE_PROC_REF(/datum/admins, restart),
	TYPE_PROC_REF(/datum/admins, end_round),
	TYPE_PROC_REF(/datum/admins, delay),
	TYPE_PROC_REF(/datum/admins, toggleaban),
	TYPE_PROC_REF(/client, everyone_random),
	TYPE_PROC_REF(/datum/admins, toggleAI),
	TYPE_PROC_REF(/client, cmd_admin_delete), /*delete an instance/object/mob/etc*/
	TYPE_PROC_REF(/client, cmd_debug_del_all),
	TYPE_PROC_REF(/client, toggle_random_events),
	TYPE_PROC_REF(/client, forcerandomrotate),
	TYPE_PROC_REF(/client, adminchangemap),
	TYPE_PROC_REF(/client, panicbunker),
	TYPE_PROC_REF(/client, toggle_interviews),
	TYPE_PROC_REF(/client, toggle_require_discord),
	TYPE_PROC_REF(/client, toggle_hub),
	TYPE_PROC_REF(/client, toggle_cdn)
	)
GLOBAL_LIST_INIT(admin_verbs_debug, world.AVerbsDebug())
GLOBAL_PROTECT(admin_verbs_debug)
/world/proc/AVerbsDebug()
	return list(
	TYPE_PROC_REF(/client, restart_controller),
	TYPE_PROC_REF(/client, debug_controller),
	TYPE_PROC_REF(/client, cmd_admin_list_open_jobs),
	TYPE_PROC_REF(/client, Debug2),
	TYPE_PROC_REF(/client, cmd_debug_make_powernets),
	TYPE_PROC_REF(/client, cmd_debug_mob_lists),
	TYPE_PROC_REF(/client, cmd_admin_delete),
	TYPE_PROC_REF(/client, cmd_debug_del_all),
	TYPE_PROC_REF(/client, restart_controller),
	TYPE_PROC_REF(/client, enable_mapping_verbs),
	TYPE_PROC_REF(/client, callproc),
	TYPE_PROC_REF(/client, callproc_datum),
	TYPE_PROC_REF(/client, SDQL2_query),
	TYPE_PROC_REF(/client, test_movable_UI),
	TYPE_PROC_REF(/client, test_snap_UI),
	TYPE_PROC_REF(/client, debugNatureMapGenerator),
	TYPE_PROC_REF(/client, check_bomb_impacts),
	/proc/machine_upgrade,
	TYPE_PROC_REF(/client, populate_world),
	TYPE_PROC_REF(/client, get_dynex_power), //*debug verbs for dynex explosions.
	TYPE_PROC_REF(/client, get_dynex_range), //*debug verbs for dynex explosions.
	TYPE_PROC_REF(/client, set_dynex_scale),
	TYPE_PROC_REF(/client, cmd_display_del_log),
	TYPE_PROC_REF(/client, outfit_manager),
	TYPE_PROC_REF(/client, open_colorblind_test),
	TYPE_PROC_REF(/client, generate_wikichem_list),
	TYPE_PROC_REF(/client, modify_goals),
	TYPE_PROC_REF(/client, debug_huds),
	TYPE_PROC_REF(/client, map_template_load),
	TYPE_PROC_REF(/client, map_template_upload),
	TYPE_PROC_REF(/client, jump_to_ruin),
	TYPE_PROC_REF(/client, clear_dynamic_transit),
	TYPE_PROC_REF(/client, run_empty_query),
	TYPE_PROC_REF(/client, toggle_medal_disable),
	TYPE_PROC_REF(/client, view_runtimes),
	TYPE_PROC_REF(/client, pump_random_event),
	TYPE_PROC_REF(/client, cmd_display_init_log),
	TYPE_PROC_REF(/client, cmd_display_overlay_log),
	TYPE_PROC_REF(/client, reload_configuration),
	TYPE_PROC_REF(/client, atmos_control),
	TYPE_PROC_REF(/client, reload_cards),
	TYPE_PROC_REF(/client, validate_cards),
	TYPE_PROC_REF(/client, test_cardpack_distribution),
	TYPE_PROC_REF(/client, print_cards),
	#ifdef TESTING
	TYPE_PROC_REF(/client, check_missing_sprites),
	TYPE_PROC_REF(/client, run_dynamic_simulations),
	#endif
	TYPE_PROC_REF(/client, display_sendmaps),
	TYPE_PROC_REF(/datum/admins, create_or_modify_area),
	TYPE_PROC_REF(/client, check_timer_sources),
	TYPE_PROC_REF(/client, toggle_cdn),
	TYPE_PROC_REF(/client, cmd_sdql_spell_menu),
	TYPE_PROC_REF(/client, adventure_manager),
	TYPE_PROC_REF(/client, load_circuit),
	TYPE_PROC_REF(/client, cmd_admin_toggle_fov),
	TYPE_PROC_REF(/client, cmd_admin_debug_traitor_objectives),
	TYPE_PROC_REF(/client, spawn_debug_full_crew),
	TYPE_PROC_REF(/client, jumptocoord),
	TYPE_PROC_REF(/client, jumptokey),
	TYPE_PROC_REF(/client, jumptoarea),
	TYPE_PROC_REF(/client, admin_ghost),
	TYPE_PROC_REF(/client, cmd_admin_create_centcom_report),
	)

GLOBAL_LIST_INIT(admin_verbs_possess, list(/proc/possess, GLOBAL_PROC_REF(release)))
GLOBAL_PROTECT(admin_verbs_possess)
GLOBAL_LIST_INIT(admin_verbs_permissions, list(TYPE_PROC_REF(/client, edit_admin_permissions)))
GLOBAL_PROTECT(admin_verbs_permissions)
GLOBAL_LIST_INIT(admin_verbs_poll, list(TYPE_PROC_REF(/client, poll_panel)))
GLOBAL_PROTECT(admin_verbs_poll)

//verbs which can be hidden - needs work
GLOBAL_LIST_INIT(admin_verbs_hideable, list(
	TYPE_PROC_REF(/client, set_ooc),
	TYPE_PROC_REF(/client, reset_ooc),
	TYPE_PROC_REF(/client, deadmin),
	TYPE_PROC_REF(/datum/admins, show_traitor_panel),
	TYPE_PROC_REF(/datum/admins, show_skill_panel),
	TYPE_PROC_REF(/datum/admins, toggleenter),
	TYPE_PROC_REF(/datum/admins, toggleguests),
	TYPE_PROC_REF(/datum/admins, announce),
	TYPE_PROC_REF(/datum/admins, set_admin_notice),
	TYPE_PROC_REF(/client, admin_ghost),
	TYPE_PROC_REF(/client, toggle_view_range),
	TYPE_PROC_REF(/client, cmd_admin_subtle_message),
	TYPE_PROC_REF(/client, cmd_admin_headset_message),
	TYPE_PROC_REF(/client, cmd_admin_check_contents),
	TYPE_PROC_REF(/datum/admins, access_news_network),
	TYPE_PROC_REF(/client, admin_call_shuttle),
	TYPE_PROC_REF(/client, admin_cancel_shuttle),
	TYPE_PROC_REF(/client, cmd_admin_direct_narrate),
	TYPE_PROC_REF(/client, cmd_admin_world_narrate),
	TYPE_PROC_REF(/client, cmd_admin_local_narrate),
	TYPE_PROC_REF(/client, play_local_sound),
	TYPE_PROC_REF(/client, play_sound),
	TYPE_PROC_REF(/client, set_round_end_sound),
	TYPE_PROC_REF(/client, cmd_select_equipment),
	TYPE_PROC_REF(/client, cmd_admin_gib_self),
	TYPE_PROC_REF(/client, drop_bomb),
	TYPE_PROC_REF(/client, drop_dynex_bomb),
	TYPE_PROC_REF(/client, get_dynex_range),
	TYPE_PROC_REF(/client, get_dynex_power),
	TYPE_PROC_REF(/client, set_dynex_scale),
	TYPE_PROC_REF(/client, cinematic),
	TYPE_PROC_REF(/client, cmd_admin_add_freeform_ai_law),
	TYPE_PROC_REF(/client, cmd_admin_create_centcom_report),
	TYPE_PROC_REF(/client, cmd_change_command_name),
	TYPE_PROC_REF(/client, object_say),
	TYPE_PROC_REF(/client, toggle_random_events),
	TYPE_PROC_REF(/datum/admins, startnow),
	TYPE_PROC_REF(/datum/admins, restart),
	TYPE_PROC_REF(/datum/admins, delay),
	TYPE_PROC_REF(/datum/admins, toggleaban),
	TYPE_PROC_REF(/client, everyone_random),
	TYPE_PROC_REF(/datum/admins, toggleAI),
	TYPE_PROC_REF(/client, restart_controller),
	TYPE_PROC_REF(/client, cmd_admin_list_open_jobs),
	TYPE_PROC_REF(/client, callproc),
	TYPE_PROC_REF(/client, callproc_datum),
	TYPE_PROC_REF(/client, Debug2),
	TYPE_PROC_REF(/client, reload_admins),
	TYPE_PROC_REF(/client, cmd_debug_make_powernets),
	TYPE_PROC_REF(/client, cmd_debug_mob_lists),
	TYPE_PROC_REF(/client, cmd_debug_del_all),
	TYPE_PROC_REF(/client, enable_mapping_verbs),
	/proc/possess,
	/proc/release,
	TYPE_PROC_REF(/client, reload_admins),
	TYPE_PROC_REF(/client, panicbunker),
	TYPE_PROC_REF(/client, toggle_interviews),
	TYPE_PROC_REF(/client, toggle_require_discord),
	TYPE_PROC_REF(/client, admin_change_sec_level),
	TYPE_PROC_REF(/client, toggle_nuke),
	TYPE_PROC_REF(/client, cmd_display_del_log),
	TYPE_PROC_REF(/client, toggle_combo_hud),
	TYPE_PROC_REF(/client, debug_huds)
	))
GLOBAL_PROTECT(admin_verbs_hideable)

/client/proc/add_admin_verbs()
	if(holder)
		control_freak = CONTROL_FREAK_SKIN | CONTROL_FREAK_MACROS

		var/rights = holder.rank.rights
		add_verb(src, GLOB.admin_verbs_default)
		if(rights & R_BUILD)
			add_verb(src, TYPE_PROC_REF(/client, togglebuildmodeself))
		if(rights & R_ADMIN)
			add_verb(src, GLOB.admin_verbs_admin)
		if(rights & R_BAN)
			add_verb(src, GLOB.admin_verbs_ban)
		if(rights & R_FUN)
			add_verb(src, GLOB.admin_verbs_fun)
		if(rights & R_SERVER)
			add_verb(src, GLOB.admin_verbs_server)
		if(rights & R_DEBUG)
			add_verb(src, GLOB.admin_verbs_debug)
		if(rights & R_POSSESS)
			add_verb(src, GLOB.admin_verbs_possess)
		if(rights & R_PERMISSIONS)
			add_verb(src, GLOB.admin_verbs_permissions)
		if(rights & R_STEALTH)
			add_verb(src, TYPE_PROC_REF(/client, stealth))
		if(rights & R_ADMIN)
			add_verb(src, GLOB.admin_verbs_poll)
		if(rights & R_SOUND)
			add_verb(src, GLOB.admin_verbs_sounds)
			if(CONFIG_GET(string/invoke_youtubedl))
				add_verb(src, TYPE_PROC_REF(/client, play_web_sound))
		if(rights & R_SPAWN)
			add_verb(src, GLOB.admin_verbs_spawn)

/client/proc/remove_admin_verbs()
	remove_verb(src, list(
		GLOB.admin_verbs_default,
		TYPE_PROC_REF(/client, togglebuildmodeself),
		GLOB.admin_verbs_admin,
		GLOB.admin_verbs_ban,
		GLOB.admin_verbs_fun,
		GLOB.admin_verbs_server,
		GLOB.admin_verbs_debug,
		GLOB.admin_verbs_possess,
		GLOB.admin_verbs_permissions,
		TYPE_PROC_REF(/client, stealth),
		GLOB.admin_verbs_poll,
		GLOB.admin_verbs_sounds,
		TYPE_PROC_REF(/client, play_web_sound),
		GLOB.admin_verbs_spawn,
		/*Debug verbs added by "show debug verbs"*/
		GLOB.admin_verbs_debug_mapping,
		TYPE_PROC_REF(/client, disable_mapping_verbs),
		TYPE_PROC_REF(/client, readmin)
		))

/client/proc/hide_verbs()
	set name = "Adminverbs - Hide All"
	set category = "Admin"

	remove_admin_verbs()
	add_verb(src, TYPE_PROC_REF(/client, show_verbs))

	to_chat(src, span_interface("Almost all of your adminverbs have been hidden."), confidential = TRUE)
	SSblackbox.record_feedback("tally", "admin_verb", 1, "Hide All Adminverbs") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
	return

/client/proc/show_verbs()
	set name = "Adminverbs - Show"
	set category = "Admin"

	remove_verb(src, TYPE_PROC_REF(/client, show_verbs))
	add_admin_verbs()

	to_chat(src, span_interface("All of your adminverbs are now visible."), confidential = TRUE)
	SSblackbox.record_feedback("tally", "admin_verb", 1, "Show Adminverbs") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!




/client/proc/admin_ghost()
	set category = "Admin.Game"
	set name = "Aghost"
	if(!holder)
		return
	. = TRUE
	if(isobserver(mob))
		//re-enter
		var/mob/dead/observer/ghost = mob
		if(!ghost.mind || !ghost.mind.current) //won't do anything if there is no body
			return FALSE
		if(!ghost.can_reenter_corpse)
			log_admin("[key_name(usr)] re-entered corpse")
			message_admins("[key_name_admin(usr)] re-entered corpse")
		ghost.can_reenter_corpse = 1 //force re-entering even when otherwise not possible
		ghost.reenter_corpse()
		SSblackbox.record_feedback("tally", "admin_verb", 1, "Admin Reenter") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
	else if(isnewplayer(mob))
		to_chat(src, "<font color='red'>Error: Aghost: Can't admin-ghost whilst in the lobby. Join or Observe first.</font>", confidential = TRUE)
		return FALSE
	else
		//ghostize
		log_admin("[key_name(usr)] admin ghosted.")
		message_admins("[key_name_admin(usr)] admin ghosted.")
		var/mob/body = mob
		body.ghostize(1)
		init_verbs()
		if(body && !body.key)
			body.key = "@[key]" //Haaaaaaaack. But the people have spoken. If it breaks; blame adminbus
		SSblackbox.record_feedback("tally", "admin_verb", 1, "Admin Ghost") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/invisimin()
	set name = "Invisimin"
	set category = "Admin.Game"
	set desc = "Toggles ghost-like invisibility (Don't abuse this)"
	if(holder && mob)
		if(initial(mob.invisibility) == INVISIBILITY_OBSERVER)
			to_chat(mob, span_boldannounce("Invisimin toggle failed. You are already an invisible mob like a ghost."), confidential = TRUE)
			return
		if(mob.invisibility == INVISIBILITY_OBSERVER)
			mob.invisibility = initial(mob.invisibility)
			to_chat(mob, span_boldannounce("Invisimin off. Invisibility reset."), confidential = TRUE)
		else
			mob.invisibility = INVISIBILITY_OBSERVER
			to_chat(mob, span_adminnotice("<b>Invisimin on. You are now as invisible as a ghost.</b>"), confidential = TRUE)

/client/proc/check_antagonists()
	set name = "Check Antagonists"
	set category = "Admin.Game"
	if(holder)
		holder.check_antagonists()
		log_admin("[key_name(usr)] checked antagonists.") //for tsar~
		if(!isobserver(usr) && SSticker.HasRoundStarted())
			message_admins("[key_name_admin(usr)] checked antagonists.")
	SSblackbox.record_feedback("tally", "admin_verb", 1, "Check Antagonists") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/ban_panel()
	set name = "Banning Panel"
	set category = "Admin"
	if(!check_rights(R_BAN))
		return
	holder.ban_panel()
	SSblackbox.record_feedback("tally", "admin_verb", 1, "Banning Panel") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/unban_panel()
	set name = "Unbanning Panel"
	set category = "Admin"
	if(!check_rights(R_BAN))
		return
	holder.unban_panel()
	SSblackbox.record_feedback("tally", "admin_verb", 1, "Unbanning Panel") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/game_panel()
	set name = "Game Panel"
	set category = "Admin.Game"
	if(holder)
		holder.Game()
	SSblackbox.record_feedback("tally", "admin_verb", 1, "Game Panel") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/poll_panel()
	set name = "Server Poll Management"
	set category = "Admin"
	if(!check_rights(R_POLL))
		return
	holder.poll_list_panel()
	SSblackbox.record_feedback("tally", "admin_verb", 1, "Server Poll Management") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/findStealthKey(txt)
	if(txt)
		for(var/P in GLOB.stealthminID)
			if(GLOB.stealthminID[P] == txt)
				return P
	txt = GLOB.stealthminID[ckey]
	return txt

/client/proc/createStealthKey()
	var/num = (rand(0,1000))
	var/i = 0
	while(i == 0)
		i = 1
		for(var/P in GLOB.stealthminID)
			if(num == GLOB.stealthminID[P])
				num++
				i = 0
	GLOB.stealthminID["[ckey]"] = "@[num2text(num)]"

/client/proc/stealth()
	set category = "Admin"
	set name = "Stealth Mode"
	if(!holder)
		return

	if(holder.fakekey)
		disable_stealth_mode()
	else
		enable_stealth_mode()

	SSblackbox.record_feedback("tally", "admin_verb", 1, "Stealth Mode") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

#define STEALTH_MODE_TRAIT "stealth_mode"

/client/proc/enable_stealth_mode()
	var/new_key = ckeyEx(stripped_input(usr, "Enter your desired display name.", "Fake Key", key, 26))
	if(!new_key)
		return
	holder.fakekey = new_key
	createStealthKey()
	if(isobserver(mob))
		mob.invisibility = INVISIBILITY_MAXIMUM //JUST IN CASE
		mob.alpha = 0 //JUUUUST IN CASE
		mob.name = " "
		mob.mouse_opacity = MOUSE_OPACITY_TRANSPARENT

	ADD_TRAIT(mob, TRAIT_ORBITING_FORBIDDEN, STEALTH_MODE_TRAIT)
	QDEL_NULL(mob.orbiters)

	log_admin("[key_name(usr)] has turned stealth mode ON")
	message_admins("[key_name_admin(usr)] has turned stealth mode ON")

/client/proc/disable_stealth_mode()
	holder.fakekey = null
	if(isobserver(mob))
		mob.invisibility = initial(mob.invisibility)
		mob.alpha = initial(mob.alpha)
		if(mob.mind)
			if(mob.mind.ghostname)
				mob.name = mob.mind.ghostname
			else
				mob.name = mob.mind.name
		else
			mob.name = mob.real_name
		mob.mouse_opacity = initial(mob.mouse_opacity)

	REMOVE_TRAIT(mob, TRAIT_ORBITING_FORBIDDEN, STEALTH_MODE_TRAIT)

	log_admin("[key_name(usr)] has turned stealth mode OFF")
	message_admins("[key_name_admin(usr)] has turned stealth mode OFF")

#undef STEALTH_MODE_TRAIT

/client/proc/drop_bomb()
	set category = "Admin.Fun"
	set name = "Drop Bomb"
	set desc = "Cause an explosion of varying strength at your location."

	var/list/choices = list("Small Bomb (1, 2, 3, 3)", "Medium Bomb (2, 3, 4, 4)", "Big Bomb (3, 5, 7, 5)", "Maxcap", "Custom Bomb")
	var/choice = tgui_input_list(src, "What size explosion would you like to produce? NOTE: You can do all this rapidly and in an IC manner (using cruise missiles!) with the Config/Launch Supplypod verb. WARNING: These ignore the maxcap", "Drop Bomb", choices)
	if(isnull(choice))
		return
	var/turf/epicenter = mob.loc

	switch(choice)
		if("Small Bomb (1, 2, 3, 3)")
			explosion(epicenter, devastation_range = 1, heavy_impact_range = 2, light_impact_range = 3, flash_range = 3, adminlog = TRUE, ignorecap = TRUE, explosion_cause = mob)
		if("Medium Bomb (2, 3, 4, 4)")
			explosion(epicenter, devastation_range = 2, heavy_impact_range = 3, light_impact_range = 4, flash_range = 4, adminlog = TRUE, ignorecap = TRUE, explosion_cause = mob)
		if("Big Bomb (3, 5, 7, 5)")
			explosion(epicenter, devastation_range = 3, heavy_impact_range = 5, light_impact_range = 7, flash_range = 5, adminlog = TRUE, ignorecap = TRUE, explosion_cause = mob)
		if("Maxcap")
			explosion(epicenter, devastation_range = GLOB.MAX_EX_DEVESTATION_RANGE, heavy_impact_range = GLOB.MAX_EX_HEAVY_RANGE, light_impact_range = GLOB.MAX_EX_LIGHT_RANGE, flash_range = GLOB.MAX_EX_FLASH_RANGE, adminlog = TRUE, ignorecap = TRUE, explosion_cause = mob)
		if("Custom Bomb")
			var/range_devastation = input("Devastation range (in tiles):") as null|num
			if(range_devastation == null)
				return
			var/range_heavy = input("Heavy impact range (in tiles):") as null|num
			if(range_heavy == null)
				return
			var/range_light = input("Light impact range (in tiles):") as null|num
			if(range_light == null)
				return
			var/range_flash = input("Flash range (in tiles):") as null|num
			if(range_flash == null)
				return
			if(range_devastation > GLOB.MAX_EX_DEVESTATION_RANGE || range_heavy > GLOB.MAX_EX_HEAVY_RANGE || range_light > GLOB.MAX_EX_LIGHT_RANGE || range_flash > GLOB.MAX_EX_FLASH_RANGE)
				if(tgui_alert(usr, "Bomb is bigger than the maxcap. Continue?",,list("Yes","No")) != "Yes")
					return
			epicenter = mob.loc //We need to reupdate as they may have moved again
			explosion(epicenter, devastation_range = range_devastation, heavy_impact_range = range_heavy, light_impact_range = range_light, flash_range = range_flash, adminlog = TRUE, ignorecap = TRUE, explosion_cause = mob)
	message_admins("[ADMIN_LOOKUPFLW(usr)] creating an admin explosion at [epicenter.loc].")
	log_admin("[key_name(usr)] created an admin explosion at [epicenter.loc].")
	SSblackbox.record_feedback("tally", "admin_verb", 1, "Drop Bomb") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/drop_dynex_bomb()
	set category = "Admin.Fun"
	set name = "Drop DynEx Bomb"
	set desc = "Cause an explosion of varying strength at your location."

	var/ex_power = input("Explosive Power:") as null|num
	var/turf/epicenter = mob.loc
	if(ex_power && epicenter)
		dyn_explosion(epicenter, ex_power)
		message_admins("[ADMIN_LOOKUPFLW(usr)] creating an admin explosion at [epicenter.loc].")
		log_admin("[key_name(usr)] created an admin explosion at [epicenter.loc].")
		SSblackbox.record_feedback("tally", "admin_verb", 1, "Drop Dynamic Bomb") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/get_dynex_range()
	set category = "Debug"
	set name = "Get DynEx Range"
	set desc = "Get the estimated range of a bomb, using explosive power."

	var/ex_power = input("Explosive Power:") as null|num
	if (isnull(ex_power))
		return
	var/range = round((2 * ex_power)**GLOB.DYN_EX_SCALE)
	to_chat(usr, "Estimated Explosive Range: (Devastation: [round(range*0.25)], Heavy: [round(range*0.5)], Light: [round(range)])", confidential = TRUE)

/client/proc/get_dynex_power()
	set category = "Debug"
	set name = "Get DynEx Power"
	set desc = "Get the estimated required power of a bomb, to reach a specific range."

	var/ex_range = input("Light Explosion Range:") as null|num
	if (isnull(ex_range))
		return
	var/power = (0.5 * ex_range)**(1/GLOB.DYN_EX_SCALE)
	to_chat(usr, "Estimated Explosive Power: [power]", confidential = TRUE)

/client/proc/set_dynex_scale()
	set category = "Debug"
	set name = "Set DynEx Scale"
	set desc = "Set the scale multiplier of dynex explosions. The default is 0.5."

	var/ex_scale = input("New DynEx Scale:") as null|num
	if(!ex_scale)
		return
	GLOB.DYN_EX_SCALE = ex_scale
	log_admin("[key_name(usr)] has modified Dynamic Explosion Scale: [ex_scale]")
	message_admins("[key_name_admin(usr)] has  modified Dynamic Explosion Scale: [ex_scale]")

/client/proc/atmos_control()
	set name = "Atmos Control Panel"
	set category = "Debug"
	if(!check_rights(R_DEBUG))
		return
	SSair.ui_interact(mob)

/client/proc/reload_cards()
	set name = "Reload Cards"
	set category = "Debug"
	if(!check_rights(R_DEBUG))
		return
	if(!SStrading_card_game.loaded)
		message_admins("The card subsystem is not currently loaded")
		return
	SStrading_card_game.reloadAllCardFiles()

/client/proc/validate_cards()
	set name = "Validate Cards"
	set category = "Debug"
	if(!check_rights(R_DEBUG))
		return
	if(!SStrading_card_game.loaded)
		message_admins("The card subsystem is not currently loaded")
		return
	var/message = SStrading_card_game.checkCardpacks(SStrading_card_game.card_packs)
	message += SStrading_card_game.checkCardDatums()
	if(message)
		message_admins(message)

/client/proc/test_cardpack_distribution()
	set name = "Test Cardpack Distribution"
	set category = "Debug"
	if(!check_rights(R_DEBUG))
		return
	if(!SStrading_card_game.loaded)
		message_admins("The card subsystem is not currently loaded")
		return
	var/pack = input("Which pack should we test?", "You fucked it didn't you") as null|anything in sort_list(SStrading_card_game.card_packs)
	var/batchCount = input("How many times should we open it?", "Don't worry, I understand") as null|num
	var/batchSize = input("How many cards per batch?", "I hope you remember to check the validation") as null|num
	var/guar = input("Should we use the pack's guaranteed rarity? If so, how many?", "We've all been there. Man you should have seen the old system") as null|num
	SStrading_card_game.checkCardDistribution(pack, batchSize, batchCount, guar)

/client/proc/print_cards()
	set name = "Print Cards"
	set category = "Debug"
	SStrading_card_game.printAllCards()

/client/proc/give_spell(mob/spell_recipient in GLOB.mob_list)
	set category = "Admin.Fun"
	set name = "Give Spell"
	set desc = "Gives a spell to a mob."

	var/list/spell_list = list()
	var/type_length = length_char("/obj/effect/proc_holder/spell") + 2
	for(var/spell in GLOB.spells)
		spell_list[copytext_char("[spell]", type_length)] = spell
	var/spell_desc = input("Choose the spell to give to that guy", "ABRAKADABRA") as null|anything in sort_list(spell_list)
	if(!spell_desc)
		return

	var/robeless = (tgui_alert(usr, "Would you like to force this spell to be robeless?", "Robeless Casting?", list("Force Robeless", "Use Spell Setting")) == "Force Robeless")

	if(QDELETED(spell_recipient))
		to_chat(usr, span_warning("The intended spell recipient no longer exists."))
		return

	SSblackbox.record_feedback("tally", "admin_verb", 1, "Give Spell") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
	log_admin("[key_name(usr)] gave [key_name(spell_recipient)] the spell [spell_desc][robeless ? " (Forced robeless)" : ""].")
	message_admins(span_adminnotice("[key_name_admin(usr)] gave [key_name_admin(spell_recipient)] the spell [spell_desc][spell_desc][robeless ? " (Forced robeless)" : ""]."))

	var/spell_path = spell_list[spell_desc]
	var/obj/effect/proc_holder/spell/new_spell = new spell_path()

	if(robeless)
		new_spell.clothes_req = FALSE

	if(spell_recipient.mind)
		spell_recipient.mind.AddSpell(new_spell)
	else
		spell_recipient.AddSpell(new_spell)
		message_admins(span_danger("Spells given to mindless mobs will not be transferred in mindswap or cloning!"))

/client/proc/remove_spell(mob/removal_target in GLOB.mob_list)
	set category = "Admin.Fun"
	set name = "Remove Spell"
	set desc = "Remove a spell from the selected mob."

	var/target_spell_list = length(removal_target?.mind?.spell_list) ? removal_target.mind.spell_list : removal_target.mob_spell_list

	if(!length(target_spell_list))
		return

	var/obj/effect/proc_holder/spell/removed_spell = input("Choose the spell to remove", "NO ABRAKADABRA") as null|anything in sort_list(target_spell_list)
	if(removed_spell)
		removal_target.mind.RemoveSpell(removed_spell)
		log_admin("[key_name(usr)] removed the spell [removed_spell] from [key_name(removal_target)].")
		message_admins(span_adminnotice("[key_name_admin(usr)] removed the spell [removed_spell] from [key_name_admin(removal_target)]."))
		SSblackbox.record_feedback("tally", "admin_verb", 1, "Remove Spell") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/give_disease(mob/living/T in GLOB.mob_living_list)
	set category = "Admin.Fun"
	set name = "Give Disease"
	set desc = "Gives a Disease to a mob."
	if(!istype(T))
		to_chat(src, span_notice("You can only give a disease to a mob of type /mob/living."), confidential = TRUE)
		return
	var/datum/disease/D = input("Choose the disease to give to that guy", "ACHOO") as null|anything in sort_list(SSdisease.diseases, GLOBAL_PROC_REF(cmp_typepaths_asc))
	if(!D)
		return
	T.ForceContractDisease(new D, FALSE, TRUE)
	SSblackbox.record_feedback("tally", "admin_verb", 1, "Give Disease") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
	log_admin("[key_name(usr)] gave [key_name(T)] the disease [D].")
	message_admins(span_adminnotice("[key_name_admin(usr)] gave [key_name_admin(T)] the disease [D]."))

/client/proc/object_say(obj/O in world)
	set category = "Admin.Events"
	set name = "OSay"
	set desc = "Makes an object say something."
	var/message = tgui_input_text(usr, "What do you want the message to be?", "Make Sound", encode = FALSE)
	if(!message)
		return
	O.say(message, sanitize = FALSE)
	log_admin("[key_name(usr)] made [O] at [AREACOORD(O)] say \"[message]\"")
	message_admins(span_adminnotice("[key_name_admin(usr)] made [O] at [AREACOORD(O)]. say \"[message]\""))
	SSblackbox.record_feedback("tally", "admin_verb", 1, "Object Say") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
/client/proc/togglebuildmodeself()
	set name = "Toggle Build Mode Self"
	set category = "Admin.Events"
	if (!(holder.rank.rights & R_BUILD))
		return
	if(src.mob)
		togglebuildmode(src.mob)
	SSblackbox.record_feedback("tally", "admin_verb", 1, "Toggle Build Mode") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/check_ai_laws()
	set name = "Check AI Laws"
	set category = "Admin.Game"
	if(holder)
		src.holder.output_ai_laws()

/client/proc/deadmin()
	set name = "Deadmin"
	set category = "Admin"
	set desc = "Shed your admin powers."

	if(!holder)
		return

	holder.deactivate()

	to_chat(src, span_interface("You are now a normal player."))
	log_admin("[src] deadminned themselves.")
	message_admins("[src] deadminned themselves.")
	SSblackbox.record_feedback("tally", "admin_verb", 1, "Deadmin")

/client/proc/readmin()
	set name = "Readmin"
	set category = "Admin"
	set desc = "Regain your admin powers."

	var/datum/admins/A = GLOB.deadmins[ckey]

	if(!A)
		A = GLOB.admin_datums[ckey]
		if (!A)
			var/msg = " is trying to readmin but they have no deadmin entry"
			message_admins("[key_name_admin(src)][msg]")
			log_admin_private("[key_name(src)][msg]")
			return

	A.associate(src)

	if (!holder)
		return //This can happen if an admin attempts to vv themself into somebody elses's deadmin datum by getting ref via brute force

	to_chat(src, span_interface("You are now an admin."), confidential = TRUE)
	message_admins("[src] re-adminned themselves.")
	log_admin("[src] re-adminned themselves.")
	SSblackbox.record_feedback("tally", "admin_verb", 1, "Readmin")

/client/proc/populate_world(amount = 50 as num)
	set name = "Populate World"
	set category = "Debug"
	set desc = "(\"Amount of mobs to create\") Populate the world with test mobs."

	if (amount > 0)
		var/area/area
		var/list/candidates
		var/turf/open/floor/tile
		var/j,k

		for (var/i = 1 to amount)
			j = 100

			do
				area = pick(GLOB.the_station_areas)

				if (area)

					candidates = get_area_turfs(area)

					if (length(candidates))
						k = 100

						do
							tile = pick(candidates)
						while ((!tile || !istype(tile)) && --k > 0)

						if (tile)
							var/mob/living/carbon/human/hooman = new(tile)
							hooman.equipOutfit(pick(subtypesof(/datum/outfit)))
							testing("Spawned test mob at [COORD(tile)]")
			while (!area && --j > 0)

/client/proc/toggle_AI_interact()
	set name = "Toggle Admin AI Interact"
	set category = "Admin.Game"
	set desc = "Allows you to interact with most machines as an AI would as a ghost"

	AI_Interact = !AI_Interact
	if(mob && isAdminGhostAI(mob))
		mob.has_unlimited_silicon_privilege = AI_Interact

	log_admin("[key_name(usr)] has [AI_Interact ? "activated" : "deactivated"] Admin AI Interact")
	message_admins("[key_name_admin(usr)] has [AI_Interact ? "activated" : "deactivated"] their AI interaction")

/client/proc/debugstatpanel()
	set name = "Debug Stat Panel"
	set category = "Debug"

	src << output("", "statbrowser:create_debug")

/client/proc/admin_2fa_verify()
	set name = "Verify Admin"
	set category = "Admin"

	var/datum/admins/admin = GLOB.admin_datums[ckey]
	admin?.associate(src)

/client/proc/display_sendmaps()
	set name = "Send Maps Profile"
	set category = "Debug"

	src << link("?debug=profile&type=sendmaps&window=test")

/**
 * Debug verb that spawns human crewmembers
 * of each job type, gives them a mind and assigns the role,
 * and injects them into the manifest, as if they were a "player".
 *
 * This spawns humans with minds and jobs, but does NOT make them 'players'.
 * They're all clientles mobs with minds / jobs.
 */
/client/proc/spawn_debug_full_crew()
	set name = "Spawn Debug Full Crew"
	set desc = "Creates a full crew for the station, filling the datacore and assigning them all minds / jobs. Don't do this on live"
	set category = "Debug"

	if(!check_rights(R_DEBUG))
		return

	var/mob/admin = usr

	if(SSticker.current_state != GAME_STATE_PLAYING)
		to_chat(admin, "You should only be using this after a round has setup and started.")
		return

	// Two input checks here to make sure people are certain when they're using this.
	if(tgui_alert(admin, "This command will create a bunch of dummy crewmembers with minds, job, and datacore entries, which will take a while and fill the manifest.", "Spawn Crew", list("Yes", "Cancel")) != "Yes")
		return

	if(tgui_alert(admin, "I sure hope you aren't doing this on live. Are you sure?", "Spawn Crew (Be certain)", list("Yes", "Cancel")) != "Yes")
		return

	// Find the observer spawn, so we have a place to dump the dummies.
	var/obj/effect/landmark/observer_start/observer_point = locate(/obj/effect/landmark/observer_start) in GLOB.landmarks_list
	var/turf/destination = get_turf(observer_point)
	if(!destination)
		to_chat(admin, "Failed to find the observer spawn to send the dummies.")
		return

	// Okay, now go through all nameable occupations.
	// Pick out all jobs that have JOB_CREW_MEMBER set.
	// Then, spawn a human and slap a person into it.
	var/number_made = 0
	for(var/rank in SSjob.name_occupations)
		var/datum/job/job = SSjob.GetJob(rank)

		// JOB_CREW_MEMBER is all jobs that pretty much aren't silicon
		if(!(job.job_flags & JOB_CREW_MEMBER))
			continue

		// Create our new_player for this job and set up its mind.
		var/mob/dead/new_player/new_guy = new()
		new_guy.mind_initialize()
		new_guy.mind.name = "[rank] Dummy"

		// Assign the rank to the new player dummy.
		if(!SSjob.AssignRole(new_guy, job))
			qdel(new_guy)
			to_chat(admin, "[rank] wasn't able to be spawned.")
			continue

		// It's got a job, spawn in a human and shove it in the human.
		var/mob/living/carbon/human/character = new(destination)
		character.name = new_guy.mind.name
		new_guy.mind.transfer_to(character)
		qdel(new_guy)

		// Then equip up the human with job gear.
		SSjob.EquipRank(character, job)
		job.after_latejoin_spawn(character)

		// Finally, ensure the minds are tracked and in the manifest.
		SSticker.minds += character.mind
		if(ishuman(character))
			GLOB.data_core.manifest_inject(character)

		number_made++
		CHECK_TICK

	to_chat(admin, "[number_made] crewmembers have been created.")
