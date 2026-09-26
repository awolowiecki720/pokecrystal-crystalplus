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
	; check Mt. Silver opened for all rematches
	checkevent EVENT_OPENED_MT_SILVER
	iffalse .Done
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
	checktime MORN
	iftrue .SundayMorn
	checktime DAY
	iftrue .SundayDay
	checktime NITE
	iftrue .SundayNight
.SundayMorn
	checkflag ENGINE_DAILY_ERIKA_REMATCH
	iftrue .Done
	promptbutton
	writetext ErikaHintText
	sjump .Done
.SundayDay
	checkflag ENGINE_DAILY_SABRINA_REMATCH
	iftrue .Done
	promptbutton
	writetext SabrinaHintText
	sjump .Done
.SundayNight
	checkflag ENGINE_DAILY_BLUE_REMATCH
	iftrue .Done
	promptbutton
	writetext BlueHintText
	sjump .Done
	
.Monday
	checktime MORN
	iftrue .MondayMorn
	checktime DAY
	iftrue .MondayDay
	; Night
	sjump .Done
.MondayMorn
	checkflag ENGINE_DAILY_PRYCE_REMATCH
	iftrue .Done
	promptbutton
	writetext PryceHintText
	sjump .Done
.MondayDay	
	checkflag ENGINE_DAILY_JANINE_REMATCH
	iftrue .Done
	promptbutton
	writetext JanineHintText
	sjump .Done

.Tuesday
	checktime DAY
	iftrue .TuesdayDay
	checktime NITE
	iftrue .TuesdayNight
	; Morning
	sjump .Done
.TuesdayDay
	checkflag ENGINE_DAILY_BLAINE_REMATCH
	iftrue .Done
	promptbutton
	writetext BlaineHintText
	sjump .Done
.TuesdayNight
	checkflag ENGINE_DAILY_MORTY_REMATCH
	iftrue .Done
	promptbutton
	writetext MortyHintText
	sjump .Done

.Wednesday
	checktime MORN
	iftrue .WedMorn
	checktime DAY
	iftrue .WedDay
	checktime NITE
	iftrue .WedNight
.WedMorn
	checkflag ENGINE_DAILY_MISTY_REMATCH
	iftrue .Done
	promptbutton
	writetext MistyHintText
	sjump .Done
.WedDay
	checkflag ENGINE_DAILY_JASMINE_REMATCH
	iftrue .Done
	promptbutton
	writetext JasmineHintText
	sjump .Done
.WedNight
	checkflag ENGINE_DAILY_CHUCK_REMATCH
	iftrue .Done
	promptbutton
	writetext ChuckHintText
	sjump .Done
	
.Thursday
	checktime DAY
	iftrue .ThursdayDay
	; Morning or Nite
	sjump .Done
.ThursdayDay	
	checkflag ENGINE_DAILY_BUGSY_REMATCH
	iftrue .Done
	promptbutton
	writetext BugsyHintText
	sjump .Done

.Friday
	checktime MORN
	iftrue .FridayMorn
	checktime NITE
	iftrue .FridayNight
	; Day
	sjump .Done
.FridayMorn
	checkflag ENGINE_DAILY_LTSURGE_REMATCH
	iftrue .Done
	promptbutton
	writetext SurgeHintText
	sjump .Done
.FridayNight	
	checkflag ENGINE_DAILY_CLAIR_REMATCH
	iftrue .Done
	promptbutton
	writetext ClairHintText
	sjump .Done

.Saturday
	checktime MORN
	iftrue .SatMorn
	checktime DAY
	iftrue .SatDay
	checktime NITE
	iftrue .SatNight
.SatMorn
	checkflag ENGINE_DAILY_FALKNER_REMATCH
	iftrue .Done
	promptbutton
	writetext FalknerHintText
	sjump .Done
.SatDay
	checkflag ENGINE_DAILY_WHITNEY_REMATCH
	iftrue .Done
	promptbutton
	writetext WhitneyHintText
	sjump .Done
.SatNight	
	checkflag ENGINE_DAILY_BROCK_REMATCH
	iftrue .Done
	promptbutton
	writetext BrockHintText
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
	;pfsf"xxxxxxxxxxxxxxxxxx"
	text "Hello!"

	para "KARATE KING, the"
	line "FIGHTING DOJO's"

	para "master, is in a"
	line "cave in JOHTO for"
	cont "training."
	done

ErikaHintText:
	;pfsf"xxxxxxxxxxxxxxxxxx"
	text "The Nature Loving"
	line "Princess ERIKA is"

	para "honing her senses"
	line "at CELADON GYM."
	done

SabrinaHintText:	
	text "The PSYCHIC Master"
	line "of SAFFRON GYM is"
	
	para "predicting another"
	line "#MON battle!"
	done

BlueHintText:	
	text "Hoo-Ha!"
	
	para "BLUE, the former"
	line "CHAMPION, is eager"
	cont "for a battle."
	done	

PryceHintText:
	;pfsf"xxxxxxxxxxxxxxxxxx"
	text "I hear the Teacher"
	line "in MAHOGANY GYM"
	
	para "is ready for a"
	line "rematch today."
	done

JanineHintText:
	text "The POISON Ninja"
	line "Master of FUCHSIA"
	cont "is keen to battle."
	done

MortyHintText:
	text "The spirits near"
	line "ECRUTEAK GYM are"
	cont "very still…"
	
	para "The Mystic Seer"	
	line "seeks a battle."
	done

BlaineHintText:
	text "Heat is rising"
	line "from the cave at"
	cont "SEAFOAM ISLANDS."
	
	para "The Hot-Headed"
	line "Quiz Master must"
	
	para "be burning with"
	line "fighting spirit!"
	done

ChuckHintText:
	text "In CIANWOOD GYM,"
	line "LEADER CHUCK says:"
	
	para "His roaring fists"
	line "do the talking!"
	done

JasmineHintText:
	;pfsf"xxxxxxxxxxxxxxxxxx"
	text "The STEEL-Clad"
	line "Defense Girl from"
	
	para "OLIVINE is back"
	line "and she's ready to"
	cont "battle!"
	done

MistyHintText:
	;pfsf"xxxxxxxxxxxxxxxxxx"
	text "MISTY, the Tomboy-"
	line "ish Mermaid, is at"
	cont "CERULEAN GYM."
	
	para "She's making a"
	line "splash with her"
	cont "sweet #MON!"
	done

BugsyHintText:
	;pfsf"xxxxxxxxxxxxxxxxxx"
	text "The Walking BUG"
	line "#MON Encyclope-"
	cont "dia at AZALEA GYM"
	
	para "is studying new"
	line "battle tactics."
	done

ClairHintText:
	;pfsf"xxxxxxxxxxxxxxxxxx"
	text "The Blessed User"
	line "of DRAGON #MON" 
	cont "has trained well."
	
	para "CLAIR stands ready"
	line "for a battle at"
	cont "BLACKTHORN GYM!"
	done

SurgeHintText:
	;pfsf"xxxxxxxxxxxxxxxxxx"
	text "VERMILION GYM's"
	line "Lightning Lt. is"

	para "charging up his"
	line "#MON to battle!"
	done

FalknerHintText:
	;pfsf"xxxxxxxxxxxxxxxxxx"
	text "The Elegant Master"
	line "of FLYING #MON"
	cont "has been training"
	
	para "really hard at"
	line "his father's GYM"
	cont "in VIOLET CITY." 
	done

WhitneyHintText:
	;pfsf"xxxxxxxxxxxxxxxxxx"
	text "WHITNEY, Pretty"
	line "Girl of GOLDENROD"
	
	para "GYM, wants a new"
	line "challenge!"
	done

BrockHintText:
	;pfsf"xxxxxxxxxxxxxxxxxx"
	text "BROCK, the ROCK-"
	line "Solid Trainer, is"
	
	para "battling hard in"
	line "PEWTER GYM!"
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
