	object_const_def
	const FIGHTINGDOJO_BLACK_BELT
	const FIGHTINGDOJO_POKE_BALL

FightingDojo_MapScripts:
	def_scene_scripts

	def_callbacks

FightingDojoBlackBelt:
	faceplayer
	opentext
	writetext FightingDojoBlackBeltText
	promptbutton
	readvar VAR_WEEKDAY
	ifequal SUNDAY,    .Sunday
	ifequal MONDAY,    .Monday
	ifequal TUESDAY,   .Tuesday
	ifequal WEDNESDAY, .Wednesday
	ifequal THURSDAY,  .Thursday
	ifequal FRIDAY,    .Friday
	ifequal SATURDAY,  .Saturday
	sjump .Done

.Sunday
	writetext JohtoSundayHintText
	checkevent EVENT_OPENED_MT_SILVER
	iffalse .Done
	promptbutton
	writetext KantoSundayHintText
	sjump .Done
	
.Monday
	writetext JohtoMondayHintText
	checkevent EVENT_OPENED_MT_SILVER
	iffalse .Done
	promptbutton
	writetext KantoMondayHintText
	sjump .Done

.Tuesday
	writetext JohtoTuesdayHintText
	checkevent EVENT_OPENED_MT_SILVER
	iffalse .Done
	promptbutton
	writetext KantoTuesdayHintText
	sjump .Done

.Wednesday
	writetext JohtoWednesdayHintText
	checkevent EVENT_OPENED_MT_SILVER
	iffalse .Done
	promptbutton
	writetext KantoWednesdayHintText
	sjump .Done
	
.Thursday
	writetext JohtoThursdayHintText
	checkevent EVENT_OPENED_MT_SILVER
	iffalse .Done
	promptbutton
	writetext KantoThursdayHintText
	sjump .Done

.Friday
	writetext JohtoFridayHintText
	checkevent EVENT_OPENED_MT_SILVER
	iffalse .Done
	promptbutton
	writetext KantoFridayHintText
	sjump .Done

.Saturday
	writetext JohtoSaturdayHintText
	checkevent EVENT_OPENED_MT_SILVER
	iffalse .Done
	promptbutton
	writetext KantoSaturdayHintText
	sjump .Done

.Done	
	waitbutton
	closetext
	end

FightingDojoSign1:
	jumptext FightingDojoSign1Text

FightingDojoSign2:
	jumptext FightingDojoSign2Text

FightingDojoFocusBand:
	itemball FOCUS_BAND

FightingDojoBlackBeltText:
	text "Hello!"

	para "KARATE KING, the"
	line "FIGHTING DOJO's"

	para "master, is in a"
	line "cave in JOHTO for"
	cont "training."
	done

JohtoSundayHintText:
	text "…JOHTO'S leaders"
	line "aren't seeking any"
	cont "rematches today…"
	done

KantoSundayHintText:
	text "…Nature's princess"
	line "in CELADON, and"
	
	para "the PSYCHIC master"
	line "of SAFFRON, are"
	cont "eager for another"
	cont "#MON battle!"

	para "Hoo-ha! the former"
	line "CHAMPION awaits in"
	cont "VIRIDIAN GYM too."
	done	

JohtoMondayHintText:
	text "I hear the leader"
	line "of MAHOGANY GYM"
	cont "is ready for a"
	cont "rematch today."
	done

KantoMondayHintText:
	text "Also, the ninja"
	line "master of FUCHSIA"
	cont "is waiting in the"
	cont "shadows."
	done

JohtoTuesdayHintText:
	text "The spirits near"
	line "ECRUTEAK are very"
	cont "still…"
	
	para "The mystic seer"
	line "must be communing"
	cont "with GHOST #MON"
	cont "today."
	done

KantoTuesdayHintText:
	text "Heat is rising"
	line "from the cave at"
	cont "SEAFOAM ISLANDS."
	
	para "The hot-headed"
	line "quiz master must"
	cont "be burning with"
	cont "fighting spirit!"
	done

JohtoWednesdayHintText:
	text "In CIANWOOD GYM,"
	line "the leader says"
	cont "his roaring fists"
	cont "do the talking!"
	
	para "The STEEL-clad"
	line "maiden of OLIVINE"
	cont "is also waiting"
	cont "for a challenge!"
	done

KantoWednesdayHintText:
	text "And, the tomboyish"
	line "mermaid is at"
	cont "CERULEAN GYM."
	
	para "She's making a"
	line "splash with her"
	cont "sweet #MON!"
	done

JohtoThursdayHintText:
	text "The BUG prodigy"
	line "at AZALEA GYM"
	cont "is studying new"
	cont "battle tactics."
	done

KantoThursdayHintText:
	text "KANTO'S leaders"
	line "seem to be rest-"
	cont "ing their #MON"
	cont "today."
	done

JohtoFridayHintText:
	text "The dragon lady"
	line "of BLACKTHORN"
	cont "GYM is ready for"
	cont "a battle!"
	done

KantoFridayHintText:
	text "The soldier in"
	line "VERMILION GYM is"
	cont "electrifying his"
	cont "defenses."
	done

JohtoSaturdayHintText:
	text "The elegant bird"
	line "master in VIOLET"
	cont "GYM is ready to"
	cont "take flight!"
	
	para "Also, the pretty"
	line "girl of GOLDEN-"
	cont "ROD GYM wants a"
	cont "new challenge!"
	done

KantoSaturdayHintText:
	text "And, the leader"
	line "in PEWTER GYM"
	
	para "is ready for a"
	line "ROCK-solid fight!"
	done

FightingDojoSign1Text:
	text "What goes around"
	line "comes around!"
	done

FightingDojoSign2Text:
	text "Enemies on every"
	line "side!"
	done

FightingDojo_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 11, SAFFRON_CITY, 1
	warp_event  5, 11, SAFFRON_CITY, 1

	def_coord_events

	def_bg_events
	bg_event  4,  0, BGEVENT_READ, FightingDojoSign1
	bg_event  5,  0, BGEVENT_READ, FightingDojoSign2

	def_object_events
	object_event  4,  4, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FightingDojoBlackBelt, -1
	object_event  3,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, FightingDojoFocusBand, EVENT_PICKED_UP_FOCUS_BAND
