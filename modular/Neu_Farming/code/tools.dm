/*-----------\
|  Thresher  |
\-----------*/

/obj/item/rogueweapon/thresher/neu
	name = "thresher"
	desc = "Crushes grain, or skulls."
	icon_state = "thresher"
	icon = 'modular/Neu_Farming/icons/farmtools.dmi'
	slot_flags = ITEM_SLOT_BACK
	sharpness = IS_BLUNT
	wlength = WLENGTH_LONG
	w_class = WEIGHT_CLASS_BULKY
	walking_stick = TRUE
	minstr = 6
	gripsprite = TRUE
	drop_sound = 'sound/foley/dropsound/wooden_drop.ogg'
	smeltresult = null
	associated_skill = /datum/skill/combat/whipsflails
	possible_item_intents = list(MACE_STRIKE)
	gripped_intents = list(/datum/intent/flailthresh,MACE_STRIKE)

	force = 10
	force_wielded = 14
	wdefense = 2
	wlength = 66

/obj/item/rogueweapon/thresher/neu/military
	force = 12
	force_wielded = 25
	possible_item_intents = list(MACE_STRIKE)
	gripped_intents = list(/datum/intent/flail/strike/long, /datum/intent/flail/strike/smash/long, /datum/intent/flailthresh,)
	name = "military flail"
	desc = "Crushes skulls, or grain."
	icon_state = "military"
	minstr = 7
	smeltresult = /obj/item/ingot/iron
/* to avoid duplication
/datum/intent/flailthresh
	name = "thresh"
	icon_state = "inthresh"
	chargetime = 0
	noaa = TRUE
	candodge = FALSE
	misscost = 0
	no_attack = TRUE
*/
/obj/item/rogueweapon/thresher/neu/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.7,
"sx" = -9,
"sy" = 1,
"nx" = 10,
"ny" = 0,
"wx" = -7,
"wy" = -0,
"ex" = 6,
"ey" = 3,
"northabove" = 0,
"southabove" = 1,
"eastabove" = 1,
"westabove" = 0,
"nturn" = -15,
"sturn" = 12,
"wturn" = 0,
"eturn" = 354,
"nflip" = 0,
"sflip" = 8,
"wflip" = 8,
"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.7,
"sx" = 4,
"sy" = -7,
"nx" = -6,
"ny" = -6,
"wx" = 1,
"wy" = -8,
"ex" = 4,
"ey" = -8,
"northabove" = 0,
"southabove" = 1,
"eastabove" = 1,
"westabove" = 1,
"nturn" = -10, //-40
"sturn" = 0, // 40
"wturn" = 10, // 60
"eturn" = 0, // 25
"nflip" = 8,
"sflip" = 0,
"wflip" = 0,
"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.4,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)
/* commented since duped
/obj/item/rogueweapon/thresher/neu/afterattack(obj/target, mob/user, proximity)
	if(user.used_intent.type == /datum/intent/flailthresh)
		if(!proximity)
			return
		var/turf/T = target.loc
		var/found = FALSE
		for(var/obj/item/natural/chaff/C in T)
			found = TRUE
			C.thresh()
		if(found)
			playsound(loc,"plantcross", 90, FALSE)
			playsound(loc,"smashlimb", 35, FALSE)
			apply_farming_fatigue(user, 10)
			user.visible_message("<span class='notice'>[user] threshes the stalks!</span>", \
									"<span class='notice'>I thresh the stalks.</span>")
		return
	..()
*/

/* this is too goofy to keep sadly for now we return to infinithreshing
/obj/item/rogueweapon/thresher/neu/afterattack(obj/target, mob/living/user = usr, proximity)
	if(user.used_intent.type == /datum/intent/flailthresh)
		if(isturf(target.loc))
			var/turf/T = target.loc
			var/found = FALSE
			for(var/obj/item/natural/chaff/C in T)
				user.Immobilize(8)
				found = TRUE
				C.thresh()
				playsound(loc,"plantcross", 90, FALSE)
				playsound(loc,"smashlimb", 30, FALSE)
				apply_farming_fatigue(user, 2)
				sleep(8)
			if(found)
				user.visible_message(span_notice("[user] threshes the stalks!"), \
						span_notice("I thresh the stalks."))
		return
	..()

// Below is ok but plays sound once for every item so too loud
/obj/item/rogueweapon/thresher/neu/afterattack(obj/target, mob/living/user = usr, proximity)
	if(user.used_intent.type == /datum/intent/flailthresh)
		if(isturf(target.loc))
			var/turf/T = target.loc
			var/found = FALSE
			for(var/obj/item/natural/chaff/C in T)
				found = TRUE
				C.thresh()
			if(found)
				playsound(loc,"plantcross", 90, FALSE)
				playsound(loc,"smashlimb", 35, FALSE)
				apply_farming_fatigue(user, 10)
				user.visible_message(span_notice("[user] threshes the stalks!"), \
						span_notice("I thresh the stalks."))
		return
	..()

*/

/*---------\
|  Sickle  |
\---------*/

/obj/item/rogueweapon/sickle/neu
	force = 10
	possible_item_intents = list(DAGGER_CUT)
	name = "sickle"
	desc = "Rusted blade, worn handle, symbol of toil."
	icon_state = "sickle"
	icon = 'modular/Neu_Farming/icons/farmtools.dmi'
	sharpness = IS_SHARP
	wlength = 10
	slot_flags = ITEM_SLOT_HIP
	thrown_bclass = BCLASS_CUT
	drop_sound = 'sound/foley/dropsound/blade_drop.ogg'
	max_blade_int = 50
	smeltresult = /obj/item/ingot/iron
	associated_skill = /datum/skill/combat/knives

/obj/item/rogueweapon/sickle/neu/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -10,"sy" = 1,"nx" = 12,"ny" = 1,"wx" = -7,"wy" = 1,"ex" = 6,"ey" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/*------\
|  Hoe  |
\------*/

/obj/item/rogueweapon/hoe/neu
	name = "hoe"
	desc = ""
	icon_state = "hoe"
	icon = 'modular/Neu_Farming/icons/farmtools.dmi'
	wlength = WLENGTH_LONG
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	minstr = 5
	sharpness = IS_BLUNT
	walking_stick = TRUE
	drop_sound = 'sound/foley/dropsound/wooden_drop.ogg'
	smeltresult = /obj/item/ingot/iron
	possible_item_intents = list(/datum/intent/pick)
	gripped_intents = list(TILL_INTENT,/datum/intent/pick,POLEARM_BASH)
	associated_skill = /datum/skill/combat/polearms

	force = 5
	force_wielded = 10
	wdefense = 2
	wlength = 66



/obj/item/rogueweapon/hoe/neu/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.7,
"sx" = -11,
"sy" = 1,
"nx" = 12,
"ny" = 0,
"wx" = -7,
"wy" = -0,
"ex" = 6,
"ey" = 3,
"northabove" = 0,
"southabove" = 1,
"eastabove" = 1,
"westabove" = 0,
"nturn" = -15,
"sturn" = 12,
"wturn" = 0,
"eturn" = 354,
"nflip" = 0,
"sflip" = 8,
"wflip" = 8,
"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.8,
"sx" = 5,
"sy" = -6,
"nx" = -7,
"ny" = -6,
"wx" = 2,
"wy" = -6,
"ex" = 5,
"ey" = -4,
"northabove" = 0,
"southabove" = 1,
"eastabove" = 1,
"westabove" = 1,
"nturn" = -40,
"sturn" = 40,
"wturn" = 60,
"eturn" = 25,
"nflip" = 8,
"sflip" = 0,
"wflip" = 0,
"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.6,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)
/* to avoid conflict
/obj/item/rogueweapon/hoe/neu/attack_turf(turf/T, mob/living/user)
	if(user.used_intent.type == /datum/intent/till)
		user.changeNext_move(CLICK_CD_MELEE)
		if(istype(T, /turf/open/floor/rogue/grass))
			playsound(T,'sound/items/dig_shovel.ogg', 100, TRUE)
			if (do_after(user, 3 SECONDS, target = src))
				apply_farming_fatigue(user, 10)
				T.ChangeTurf(/turf/open/floor/rogue/dirt, flags = CHANGETURF_INHERIT_AIR)
				playsound(T,'sound/items/dig_shovel.ogg', 100, TRUE)
			return
		if(istype(T, /turf/open/floor/rogue/dirt))
			playsound(T,'sound/items/dig_shovel.ogg', 100, TRUE)
			if(do_after(user, 2 SECONDS, target = src))
				playsound(T,'sound/items/dig_shovel.ogg', 100, TRUE)
				var/obj/structure/soil/soil = get_soil_on_turf(T)
				if(soil)
					soil.user_till_soil(user)
				else
					apply_farming_fatigue(user, 8)
					new /obj/structure/soil(T)
			return
	. = ..()

/datum/intent/till
	name = "hoe"
	icon_state = "inhoe"
	chargetime = 0
	noaa = TRUE
	candodge = FALSE
	misscost = 0
*/
/*------------\
|  Pitchfork  |
\------------*/

/obj/item/rogueweapon/pitchfork/neu
	name = "pitchfork"
	desc = "Compost, chaff, hay, it matters not."
	icon_state = "pitchfork"
	icon = 'modular/Neu_Farming/icons/farmtools.dmi'
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	blade_dulling = DULLING_BASHCHOP
	walking_stick = TRUE
	minstr = 6
//	var/list/forked = list()		to avoid conflict
	drop_sound = 'sound/foley/dropsound/wooden_drop.ogg'
	possible_item_intents = list(POLEARM_THRUST, POLEARM_BASH)
	gripped_intents = list(DUMP_INTENT,POLEARM_BASH,POLEARM_THRUST)
	smeltresult = /obj/item/ingot/iron
	associated_skill = /datum/skill/combat/polearms
	thrown_bclass = BCLASS_STAB
	throwforce = 15

	force = 10
	force_wielded = 22
	wdefense = 2
	wlength = WLENGTH_LONG

/obj/item/rogueweapon/pitchfork/neu/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.7,
"sx" = -6,
"sy" = -2,
"nx" = 8,
"ny" = -2,
"wx" = -7,
"wy" = -3,
"ex" = 2,
"ey" = -3,
"northabove" = 0,
"southabove" = 1,
"eastabove" = 1,
"westabove" = 0,
"nturn" = -15,
"sturn" = 12,
"wturn" = 0,
"eturn" = 354,
"nflip" = 0,
"sflip" = 8,
"wflip" = 8,
"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.7,
"sx" = 4,
"sy" = -4,
"nx" = -7,
"ny" = -4,
"wx" = 2,
"wy" = -5,
"ex" = 5,
"ey" = -5,
"northabove" = 0,
"southabove" = 1,
"eastabove" = 1,
"westabove" = 1,
"nturn" = -135,
"sturn" = 135,
"wturn" = -240,
"eturn" = -30,
"nflip" = 0,
"sflip" = 8,
"wflip" = 8,
"eflip" = 1)
			if("onbelt")
				return list("shrink" = 0.5,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)
/*to avoid conflict
/datum/intent/pforkdump
	name = "scoop"
	icon_state = "inscoop"
	chargetime = 0
	noaa = TRUE
	candodge = FALSE
	misscost = 0
	no_attack = TRUE
*/
/obj/item/rogueweapon/pitchfork/neu/afterattack(obj/target, mob/user, proximity)
	if((!proximity) || (!wielded))
		return ..()
	testing("fuck")
	if(isopenturf(target))
		if(forked.len)
			for(var/obj/item/I in forked)
				I.forceMove(target)
				forked -= I
			to_chat(user, span_warning("I dump the stalks."))
		update_icon()
		return
	..()

/obj/item/rogueweapon/pitchfork/neu/ungrip(mob/living/carbon/user, show_message = TRUE)
	if(forked.len)
		var/turf/T = get_turf(user)
		for(var/obj/item/I in forked)
			I.forceMove(T)
			forked -= I
		update_icon()
	..()

/obj/item/rogueweapon/pitchfork/neu/update_icon()
	if(forked.len)
		icon_state = "pitchforkstuff"
	else
		icon_state = initial(icon_state)
	..()


/*-------------\
|  Egg basket  |
\-------------*/

/obj/item/storage/eggbasket
	name = "egg basket"
	icon = 'modular/Neu_Farming/icons/farmtools.dmi'
	icon_state = "eggbasket"
	w_class = WEIGHT_CLASS_NORMAL
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	resistance_flags = FLAMMABLE
	max_integrity = 70
	dropshrink = 0.8

/obj/item/storage/eggbasket/Initialize(mapload)
	. = ..()
	if(!mapload)
		return
	for(var/obj/item/I in loc)
		if(istype(I, /obj/item/reagent_containers/food/snacks/egg))
			I.forceMove(src)
	update_icon()

/obj/item/storage/eggbasket/attack_right(mob/user)
	. = ..()
	if(.)
		return
	user.changeNext_move(CLICK_CD_MELEE)
	testing("yea144")
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	var/list/things = STR.contents()
	if(things.len)
		testing("yea64")
		var/obj/item/reagent_containers/food/snacks/egg/I = pick(things)
		STR.remove_from_storage(I, get_turf(user))
		user.put_in_hands(I)

/obj/item/storage/eggbasket/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_combined_w_class = 20
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.max_items = 9
	STR.click_gather = TRUE
	STR.attack_hand_interact = FALSE
	STR.collection_mode = COLLECT_EVERYTHING
	STR.dump_time = 0
	STR.allow_quick_gather = FALSE
	STR.allow_quick_empty = TRUE
	STR.allow_look_inside = TRUE
	STR.display_numerical_stacking = TRUE
	CANHOLD_STATIC(STR, typecacheof(list(/obj/item/reagent_containers/food/snacks/egg)))

/obj/item/storage/eggbasket/update_icon()
//	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
//	var/list/things = STR.contents()
	switch(contents.len)
		if(0)
			icon_state = "[initial(icon_state)]"
			w_class = WEIGHT_CLASS_NORMAL
		if(1 to 3)
			icon_state = "[initial(icon_state)]1"
			w_class = WEIGHT_CLASS_BULKY
		if(4 to 6)
			icon_state = "[initial(icon_state)]2"
		else
			icon_state = "[initial(icon_state)]3"

/obj/item/storage/eggbasket/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.4,
"sx" = -4,
"sy" = -3,
"nx" = 6,
"ny" = -3,
"wx" = -2,
"wy" = -3,
"ex" = -1,
"ey" = -3,
"northabove" = 0,
"southabove" = 1,
"eastabove" = 1,
"westabove" = 0,
"nturn" = 0,
"sturn" = 0,
"wturn" = 0,
"eturn" = 0,
"nflip" = 8,
"sflip" = 0,
"wflip" = 0,
"eflip" = 8)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)


/obj/item/rogueweapon/shovel/neu
	force = 5
	force_wielded = 12
	possible_item_intents = list(/datum/intent/mace/strike/shovel)
	gripped_intents = list(/datum/intent/shovelscoop, /datum/intent/mace/strike/shovel, /datum/intent/axe/chop)
	name = "shovel"
	desc = ""
	icon_state = "shovel"
	icon = 'modular/Neu_Farming/icons/farmtools.dmi'
	sharpness = IS_BLUNT
	dropshrink = 0.9
	wdefense = 1
	wlength = WLENGTH_LONG
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	swingsound = list('sound/combat/wooshes/blunt/shovel_swing.ogg','sound/combat/wooshes/blunt/shovel_swing2.ogg')
	drop_sound = 'sound/foley/dropsound/shovel_drop.ogg'
//	var/obj/item/natural/dirtclod/heldclod
	smeltresult = /obj/item/ingot/iron
	associated_skill = /datum/skill/combat/polearms
	max_blade_int = 50

/obj/item/rogueweapon/sickle/kama
	possible_item_intents = list(/datum/intent/axe/cut,/datum/intent/axe/chop,MACE_STRIKE,/datum/intent/flailthresh)
	name = "kama"
	desc = "Originally created for the harvesting of rice, the kama has also found popularity as a commoner's weapon thanks to its axe-like design. On occasion, one is combined with a length of chain to make a kusari gama."
	icon_state = "kama"
	icon = 'icons/roguetown/kaizoku/weapons/32.dmi'
	associated_skill = /datum/skill/combat/axesmaces
	force = 15 // Same damage as Iron Swords with less integrity.
	force_wielded = 20
	max_blade_int = 100
	max_integrity = 200
	blade_dulling = DULLING_BASHCHOP
	wdefense = 4
