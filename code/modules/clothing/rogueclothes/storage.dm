/obj/item/storage/belt/rogue
	name = ""
	desc = ""
	icon = 'icons/roguetown/clothing/belts.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/belts.dmi'
	icon_state = ""
	item_state = ""
	slot_flags = ITEM_SLOT_BELT
	w_class = WEIGHT_CLASS_NORMAL
	attack_verb = list("whips", "lashes")
	max_integrity = 300
	equip_sound = 'sound/blank.ogg'
	content_overlays = FALSE
	bloody_icon_state = "bodyblood"
	var/heldz_items = 3

/obj/item/storage/belt/rogue/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		STR.max_combined_w_class = 6
		STR.max_w_class = WEIGHT_CLASS_SMALL
		STR.max_items = heldz_items

/obj/item/storage/belt/rogue/attack_right(mob/user)
	var/datum/component/storage/CP = GetComponent(/datum/component/storage)
	if(CP)
		CP.rmb_show(user)
		return TRUE
	..()

/obj/item/storage/belt/rogue/leather
	name = "belt"
	desc = "A leather belt."
	icon_state = "leather"
	item_state = "leather"
	equip_sound = 'sound/blank.ogg'
	heldz_items = 3

/obj/item/storage/belt/rogue/leather/dropped(mob/living/carbon/human/user)
	..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		var/list/things = STR.contents()
		for(var/obj/item/I in things)
			STR.remove_from_storage(I, get_turf(src))

/obj/item/storage/belt/rogue/leather/assassin // Assassin's super edgy and cool belt can carry normal items (for poison vial, lockpick).
	heldz_items = 3

/obj/item/storage/belt/rogue/leather/assassin/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		STR.max_combined_w_class = 8
		STR.max_w_class = WEIGHT_CLASS_NORMAL
		STR.max_items = heldz_items
//Assassin's belt starts with their unique dagger, a vial of highly-deadly poison, and a lockpick.
/obj/item/storage/belt/rogue/leather/assassin/PopulateContents()
	new /obj/item/reagent_containers/glass/bottle/rogue/poison(src)
	new /obj/item/rogueweapon/knife/dagger/steel/profane(src)
	new /obj/item/lockpick(src)

//Bandit's belt starts with a simple needle and a key to their hideout.
/obj/item/storage/belt/rogue/leather/bandit/PopulateContents()
	new /obj/item/needle/thorn(src)
	new /obj/item/roguekey/bandit(src)

//Mercs belt variants start with a bandage and a key to their guildhall.
/obj/item/storage/belt/rogue/leather/mercenary/PopulateContents()
	new /obj/item/natural/cloth(src)
	new /obj/item/roguekey/mercenary(src)

/obj/item/storage/belt/rogue/leather/mercenary/shalal
	name = "shalal belt"
	icon_state = "shalal"
/obj/item/storage/belt/rogue/leather/mercenary/black
	name = "black belt"
	icon_state = "blackbelt"

/obj/item/storage/belt/rogue/leather/mason/PopulateContents()
	new /obj/item/keyring/mason(src)

/obj/item/storage/belt/rogue/leather/sheriff/PopulateContents()
	new /obj/item/rogueweapon/knife/dagger/steel(src)
	new /obj/item/needle/thorn(src)
	new /obj/item/keyring/captain(src)

/obj/item/storage/belt/rogue/leather/townwatch/PopulateContents()
	new /obj/item/rogueweapon/knife/dagger(src)
	new /obj/item/needle/thorn(src)
	new /obj/item/keyring/guard(src)

/obj/item/storage/belt/rogue/leather/plaquegold
	name = "plaque belt"
	desc = "A belt with a golden plaque on its front."
	icon_state = "goldplaque"
	sellprice = 50

/obj/item/storage/belt/rogue/leather/shalal
	name = "shalal belt"
	icon_state = "shalal"
	sellprice = 5

/obj/item/storage/belt/rogue/leather/black
	name = "black belt"
	icon_state = "blackbelt"
	sellprice = 10

/obj/item/storage/belt/rogue/leather/plaquesilver
	name = "plaque belt"
	desc = "A belt with a silver plaque on its front."
	icon_state = "silverplaque"
	sellprice = 30

/obj/item/storage/belt/rogue/leather/hand
	name = "steel belt"
	desc = "A belt with a steel plate on its front."
	icon_state = "steelplaque"
	sellprice = 30

/obj/item/storage/belt/rogue/leather/rope
	name = "rope belt"
	desc = "A simple belt made of rope."
	icon_state = "rope"
	item_state = "rope"
	color = "#b9a286"
	heldz_items = 1

/obj/item/storage/belt/rogue/leather/rope/apprentice
	desc = "A rope dyed yellow serves as a belt for Makers Guilds apprentices."
	color = "#ac9a15"

/obj/item/storage/belt/rogue/leather/cloth
	name = "cloth sash"
	desc = "A simple cloth sash."
	icon_state = "cloth"
	heldz_items = 1

/obj/item/storage/belt/rogue/leather/cloth/lady
	color = "#575160"
/obj/item/storage/belt/rogue/leather/cloth/lady/Initialize()
	. = ..()
	new /obj/item/needle(src)

/obj/item/storage/belt/rogue/leather/cloth/tailor
	color = "#756889"
/obj/item/storage/belt/rogue/leather/cloth/tailor/Initialize()
	. = ..()
	new /obj/item/roguekey/tailor(src)
	new /obj/item/rogueweapon/knife/dagger(src)
	new /obj/item/needle(src)

/obj/item/storage/belt/rogue/leather/nitemaster
	color = "#cfabcb"
/obj/item/storage/belt/rogue/leather/nitemaster/Initialize()
	. = ..()
	new /obj/item/roguecoin/copper/pile (src)

/obj/item/storage/belt/rogue/pouch
	name = "pouch"
	desc = "Usually used for holding coins."
	icon = 'icons/roguetown/clothing/storage.dmi'
	mob_overlay_icon = null
	icon_state = "pouch"
	item_state = "pouch"
	lefthand_file = 'icons/mob/inhands/equipment/belt_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/belt_righthand.dmi'
	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_NECK
	w_class = WEIGHT_CLASS_NORMAL
	attack_verb = list("whips", "lashes")
	max_integrity = 300
	equip_sound = 'sound/blank.ogg'
	content_overlays = FALSE
	bloody_icon_state = "bodyblood"

/obj/item/storage/belt/rogue/pouch/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		STR.max_combined_w_class = 3
		STR.max_w_class = WEIGHT_CLASS_NORMAL
		STR.max_items = 3
		STR.not_while_equipped = FALSE

/obj/item/storage/belt/rogue/pouch/coins/mid/Initialize()
	. = ..()
	var/obj/item/roguecoin/silver/pile/H = new(loc)
	if(istype(H))
		if(!SEND_SIGNAL(src, COMSIG_TRY_STORAGE_INSERT, H, null, TRUE, TRUE))
			qdel(H)
	var/obj/item/roguecoin/copper/pile/C = new(loc)
	if(istype(C))
		if(!SEND_SIGNAL(src, COMSIG_TRY_STORAGE_INSERT, C, null, TRUE, TRUE))
			qdel(C)

/obj/item/storage/belt/rogue/pouch/coins/poor/Initialize()
	. = ..()
	var/obj/item/roguecoin/copper/pile/H = new(loc)
	if(istype(H))
		if(!SEND_SIGNAL(src, COMSIG_TRY_STORAGE_INSERT, H, null, TRUE, TRUE))
			qdel(H)
	if(prob(50))
		H = new(loc)
		if(istype(H))
			if(!SEND_SIGNAL(src, COMSIG_TRY_STORAGE_INSERT, H, null, TRUE, TRUE))
				qdel(H)

/obj/item/storage/belt/rogue/pouch/coins/rich/Initialize()
	. = ..()
	var/obj/item/roguecoin/silver/pile/H = new(loc)
	if(istype(H))
		if(!SEND_SIGNAL(src, COMSIG_TRY_STORAGE_INSERT, H, null, TRUE, TRUE))
			qdel(H)
	H = new(loc)
	if(istype(H))
		if(!SEND_SIGNAL(src, COMSIG_TRY_STORAGE_INSERT, H, null, TRUE, TRUE))
			qdel(H)
	if(prob(50))
		H = new(loc)
		if(istype(H))
			if(!SEND_SIGNAL(src, COMSIG_TRY_STORAGE_INSERT, H, null, TRUE, TRUE))
				qdel(H)

/obj/item/storage/belt/rogue/pouch/coins/veryrich/Initialize()
	. = ..()
	var/obj/item/roguecoin/gold/pile/H = new(loc)
	if(istype(H))
		if(!SEND_SIGNAL(src, COMSIG_TRY_STORAGE_INSERT, H, null, TRUE, TRUE))
			qdel(H)
	H = new(loc)
	if(istype(H))
		if(!SEND_SIGNAL(src, COMSIG_TRY_STORAGE_INSERT, H, null, TRUE, TRUE))
			qdel(H)
	if(prob(50))
		H = new(loc)
		if(istype(H))
			if(!SEND_SIGNAL(src, COMSIG_TRY_STORAGE_INSERT, H, null, TRUE, TRUE))
				qdel(H)

/obj/item/storage/belt/rogue/pouch/bullets/Initialize()
	. = ..()
	new /obj/item/ammo_casing/caseless/rogue/bullet(src)
	new /obj/item/ammo_casing/caseless/rogue/bullet(src)
	new /obj/item/ammo_casing/caseless/rogue/bullet(src)


//Nitemaiden pouch
/obj/item/storage/belt/rogue/pouch/nitemaiden/PopulateContents()
	if(prob(50))
		new /obj/item/paper/feldsher_certificate(src)
	else
		new /obj/item/paper/feldsher_certificate/expired(src)
	new /obj/item/bath/soap(src)
	new /obj/item/roguecoin/copper/pile(src)

//Darts pouch
/obj/item/storage/belt/rogue/pouch/blowgun/PopulateContents()
	new /obj/item/ammo_casing/caseless/rogue/dart/poison(src)
	new /obj/item/ammo_casing/caseless/rogue/dart/poison(src)
	new /obj/item/ammo_casing/caseless/rogue/dart/poison(src)

/obj/item/storage/belt/rogue/pouch/burglar/PopulateContents()
	new /obj/item/roguecoin/copper/pile (src)
	new /obj/item/lockpick (src)


/obj/item/storage/backpack/rogue/satchel
	name = "satchel"
	desc = "A bulky bag worn over the shoulder which can be used to hold many things."
	icon_state = "satchel"
	item_state = "satchel"
	icon = 'icons/roguetown/clothing/storage.dmi'
	lefthand_file = 'icons/mob/inhands/equipment/backpack_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/backpack_righthand.dmi'
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	resistance_flags = NONE
	max_integrity = 300
	equip_sound = 'sound/blank.ogg'
	bloody_icon_state = "bodyblood"
	alternate_worn_layer = UNDER_CLOAK_LAYER

/obj/item/storage/backpack/rogue/satchel/heartfelt/PopulateContents()
	new /obj/item/natural/feather(src)
	new /obj/item/paper/heartfelt/random(src)


/obj/item/storage/backpack/rogue/satchel/black
	color = CLOTHING_SOOT_BLACK

/obj/item/storage/backpack/rogue/satchel/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		STR.max_combined_w_class = 21
		STR.max_w_class = WEIGHT_CLASS_NORMAL
		STR.max_items = 4

/obj/item/storage/backpack/rogue/attack_right(mob/user)
	var/datum/component/storage/CP = GetComponent(/datum/component/storage)
	if(CP)
		CP.rmb_show(user)
		return TRUE


/obj/item/storage/backpack/rogue/backpack
	name = "backpack"
	desc = "A bulky backpack worn on the back which can store many items."
	icon_state = "backpack"
	item_state = "backpack"
	icon = 'icons/roguetown/clothing/storage.dmi'
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK_L
	resistance_flags = NONE
	max_integrity = 300
	equip_sound = 'sound/blank.ogg'
	bloody_icon_state = "bodyblood"

/obj/item/storage/backpack/rogue/backpack/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		STR.max_combined_w_class = 42
		STR.max_w_class = WEIGHT_CLASS_NORMAL
		STR.max_items = 14
		STR.not_while_equipped = TRUE

/obj/item/storage/backpack/rogue/satchel/surgbag
	name = "surgery bag"
	desc = "Contains all the phreakish devices one needs to cut a person up."
	item_state = "doctorbag"
	icon_state = "doctorbag"
	attack_verb = list("beats", "bludgeons")

/obj/item/storage/backpack/rogue/satchel/surgbag/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		STR.max_combined_w_class = 42
		STR.max_w_class = WEIGHT_CLASS_NORMAL
		STR.max_items = 14

/obj/item/storage/backpack/rogue/satchel/surgbag/PopulateContents()
	new /obj/item/needle/blessed(src)
	new /obj/item/rogueweapon/surgery/scalpel(src)
	new /obj/item/rogueweapon/surgery/saw(src)
	new /obj/item/rogueweapon/surgery/hemostat(src)
	new /obj/item/rogueweapon/surgery/hemostat(src)
	new /obj/item/rogueweapon/surgery/retractor(src)
	new /obj/item/rogueweapon/surgery/bonesetter(src)
	new /obj/item/rogueweapon/surgery/cautery(src)
	new /obj/item/natural/worms/leech/parasite(src)
	new /obj/item/rogueweapon/surgery/hammer(src)

/obj/item/storage/belt/rogue/kaizoku/leather/daisho
	name = "daisho belt"
	desc = "A oil-boiled reinforced silk or leather belt used by Abyssariads for practicing Daisho."
	icon_state = "daisho"
	sellprice = 5
	icon = 'icons/roguetown/kaizoku/clothingicon/belts.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/belts.dmi'

/obj/item/storage/belt/rogue/kaizoku/leather/daisho/random/Initialize()
	color = RANDOM_PEASANT_DYES
	..()

/obj/item/storage/belt/rogue/kaizoku/leather/daisho/ninja/PopulateContents()
	new /obj/item/reagent_containers/food/snacks/fogdart(src)
	new /obj/item/reagent_containers/food/snacks/fogdart(src)
	new /obj/item/rogueweapon/tetsubishi(src)

/obj/item/storage/belt/rogue/kaizoku/leather/daisho/thunder
	name = "thunder daisho belt"
	color = CLOTHING_THUNDER

/obj/item/storage/belt/rogue/kaizoku/leather/daisho/storm
	name = "storm daisho belt"
	color = CLOTHING_STORM

/obj/item/storage/belt/rogue/kaizoku/leather/daisho/ocean
	name = "ocean daisho belt"
	color = CLOTHING_OCEAN

/obj/item/storage/belt/rogue/kaizoku/leather/daisho/island
	name = "island daisho belt"
	color = CLOTHING_ISLAND

/obj/item/storage/backpack/rogue/satchel/ninja/PopulateContents()
	new /obj/item/grenade/smoke_bomb(src)
	new /obj/item/grenade/smoke_bomb/poison(src)
	new /obj/item/throwing_star/ninja(src)
