	object_const_def
	const FIGHTINGDOJO_BLACK_BELT
	const FIGHTINGDOJO_POKE_BALL
	const FIGHTINGDOJO_REMATCH_1
	const FIGHTINGDOJO_REMATCH_2
	const FIGHTINGDOJO_REMATCH_3

FightingDojo_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, FightingDojoSetupRematchesCallback

MACRO dojo_rematch_appear
	variablesprite \1, \2
	moveobject \3, \4, \5
	setval \6 << 4
	writemem wMap1ObjectPalette + (\3 - FIGHTINGDOJO_BLACK_BELT) * MAPOBJECT_LENGTH
	appear \3
	special LoadUsedSpritesGFX
ENDM

FightingDojoSetupRematchesCallback:
	disappear FIGHTINGDOJO_REMATCH_1
	disappear FIGHTINGDOJO_REMATCH_2
	disappear FIGHTINGDOJO_REMATCH_3
	checkevent EVENT_OPENED_MT_SILVER
	iffalse .Done
	readvar VAR_WEEKDAY
	ifequal MONDAY, .Monday
	ifequal TUESDAY, .Tuesday
	ifequal WEDNESDAY, .Wednesday
	ifequal THURSDAY, .Thursday
	ifequal FRIDAY, .Friday
	ifequal SATURDAY, .Saturday
	ifequal SUNDAY, .Sunday
.Done:
	endcallback

.Monday
	checktime MORN
	iftrue .MondayMorn
	checktime DAY
	iftrue .MondayDay
	sjump .Done
.MondayMorn
	dojo_rematch_appear SPRITE_DOLL_1, SPRITE_PRYCE, FIGHTINGDOJO_REMATCH_1, 1, 4, PAL_NPC_BROWN
	endcallback
.MondayDay
	dojo_rematch_appear SPRITE_DOLL_2, SPRITE_JANINE, FIGHTINGDOJO_REMATCH_2, 3, 6, PAL_NPC_BLUE
	endcallback

.Tuesday
	checktime DAY
	iftrue .TuesdayDay
	checktime NITE
	iftrue .TuesdayNight
	sjump .Done
.TuesdayDay
	dojo_rematch_appear SPRITE_DOLL_1, SPRITE_BLAINE, FIGHTINGDOJO_REMATCH_1, 7, 6, PAL_NPC_BROWN
	endcallback
.TuesdayNight
	dojo_rematch_appear SPRITE_DOLL_2, SPRITE_MORTY, FIGHTINGDOJO_REMATCH_2, 1, 6, PAL_NPC_BROWN
	endcallback

.Wednesday
	checktime MORN
	iftrue .WednesdayMorn
	checktime DAY
	iftrue .WednesdayDay
	checktime NITE
	iftrue .WednesdayNight
	sjump .Done
.WednesdayMorn
	dojo_rematch_appear SPRITE_DOLL_1, SPRITE_MISTY, FIGHTINGDOJO_REMATCH_1, 4, 7, PAL_NPC_RED
	endcallback
.WednesdayDay
	dojo_rematch_appear SPRITE_DOLL_2, SPRITE_JASMINE, FIGHTINGDOJO_REMATCH_2, 5, 7, PAL_NPC_RED
	endcallback
.WednesdayNight
	dojo_rematch_appear SPRITE_BIG_DOLL, SPRITE_CHUCK, FIGHTINGDOJO_REMATCH_3, 7, 7, PAL_NPC_BROWN
	endcallback

.Thursday
	checktime DAY
	iffalse .Done
	dojo_rematch_appear SPRITE_DOLL_1, SPRITE_BUGSY, FIGHTINGDOJO_REMATCH_1, 3, 8, PAL_NPC_GREEN
	endcallback

.Friday
	checktime MORN
	iftrue .FridayMorn
	checktime NITE
	iftrue .FridayNight
	sjump .Done
.FridayMorn
	dojo_rematch_appear SPRITE_DOLL_1, SPRITE_SURGE, FIGHTINGDOJO_REMATCH_1, 2, 7, PAL_NPC_BROWN
	endcallback
.FridayNight
	dojo_rematch_appear SPRITE_DOLL_2, SPRITE_CLAIR, FIGHTINGDOJO_REMATCH_2, 6, 8, PAL_NPC_BLUE
	endcallback

.Saturday
	checktime MORN
	iftrue .SaturdayMorn
	checktime DAY
	iftrue .SaturdayDay
	checktime NITE
	iftrue .SaturdayNight
	sjump .Done
.SaturdayMorn
	dojo_rematch_appear SPRITE_DOLL_1, SPRITE_FALKNER, FIGHTINGDOJO_REMATCH_1, 5, 8, PAL_NPC_BLUE
	endcallback
.SaturdayDay
	dojo_rematch_appear SPRITE_DOLL_2, SPRITE_WHITNEY, FIGHTINGDOJO_REMATCH_2, 9, 4, PAL_NPC_RED
	endcallback
.SaturdayNight
	dojo_rematch_appear SPRITE_BIG_DOLL, SPRITE_BROCK, FIGHTINGDOJO_REMATCH_3, 1, 9, PAL_NPC_BROWN
	endcallback

.Sunday
	checktime MORN
	iftrue .SundayMorn
	checktime DAY
	iftrue .SundayDay
	checktime NITE
	iftrue .SundayNight
	sjump .Done
.SundayMorn
	dojo_rematch_appear SPRITE_DOLL_1, SPRITE_ERIKA, FIGHTINGDOJO_REMATCH_1, 0, 4, PAL_NPC_GREEN
	endcallback
.SundayDay
	dojo_rematch_appear SPRITE_DOLL_2, SPRITE_SABRINA, FIGHTINGDOJO_REMATCH_2, 0, 9, PAL_NPC_RED
	endcallback
.SundayNight
	dojo_rematch_appear SPRITE_BIG_DOLL, SPRITE_BLUE, FIGHTINGDOJO_REMATCH_3, 4, 8, 0
	endcallback

MACRO dojo_rematch_script
FightingDojo\1Script:
if _NARG == 8
	applymovement \2, \8
endc
	faceplayer
	checkevent EVENT_OPENED_MT_SILVER
	iffalse .Unavailable\@
	opentext
	checkflag \3
	iftrue .AfterBattle\@
	farwritetext \6
	waitbutton
	closetext
	winlosstext Dojo\1RematchWinLossText, 0
	loadtrainer \4, \5
	startbattle
	reloadmapafterbattle
	setflag \3
	opentext
.AfterBattle\@:
	farwritetext \7
	waitbutton
	closetext
	end
.Unavailable\@:
	disappear \2
	end
ENDM

dojo_rematch_script Falkner, FIGHTINGDOJO_REMATCH_1, ENGINE_DAILY_FALKNER_REMATCH, FALKNER, FALKNER2, FalknerRematchIntroText, FalknerRematchAfterBattleText

DojoFalknerRematchWinLossText:
	text "Wow…"
	line "You beat me again."

	para "I'm going to train"
	line "harder to become"

	para "the greatest bird"
	line "master!"
	done

dojo_rematch_script Whitney, FIGHTINGDOJO_REMATCH_2, ENGINE_DAILY_WHITNEY_REMATCH, WHITNEY, WHITNEY2, WhitneyRematchIntroText, WhitneyRematchAfterBattleText

DojoWhitneyRematchWinLossText:
	text "Ugh…"

	para "…Snivel, hic…"
	line "…You meanie!"
	done

dojo_rematch_script Brock, FIGHTINGDOJO_REMATCH_3, ENGINE_DAILY_BROCK_REMATCH, BROCK, BROCK2, BrockRematchIntroText, BrockRematchAfterBattleText

DojoBrockRematchWinLossText:
	text "BROCK: Seems your"
	line "#MON once again"

	para "overcame my rock-"
	line "hard resistance."
	done

dojo_rematch_script Erika, FIGHTINGDOJO_REMATCH_1, ENGINE_DAILY_ERIKA_REMATCH, ERIKA, ERIKA2, ErikaRematchIntroText, ErikaRematchAfterBattleText

DojoErikaRematchWinLossText:
	text "You have grown"
	line "even stronger…"
	done

dojo_rematch_script Sabrina, FIGHTINGDOJO_REMATCH_2, ENGINE_DAILY_SABRINA_REMATCH, SABRINA, SABRINA2, SabrinaRematchIntroText, SabrinaRematchAfterBattleText

DojoSabrinaRematchWinLossText:
	text "SABRINA: Your love"
	line "for your #MON…"

	para "It overwhelmed me"
	line "again…"
	done

dojo_rematch_script Blue, FIGHTINGDOJO_REMATCH_3, ENGINE_DAILY_BLUE_REMATCH, BLUE, BLUE2, BlueRematchIntroText, BlueRematchAfterBattleText

DojoBlueRematchWinLossText:
	text "BLUE: What?"

	para "How the heck did I"
	line "lose again?"
	done

dojo_rematch_script Pryce, FIGHTINGDOJO_REMATCH_1, ENGINE_DAILY_PRYCE_REMATCH, PRYCE, PRYCE2, PryceRematchIntroText, PryceRematchAfterBattleText

DojoPryceRematchWinLossText:
	text "Hmm. Seems my luck"
	line "has run out."
	done

dojo_rematch_script Janine, FIGHTINGDOJO_REMATCH_2, ENGINE_DAILY_JANINE_REMATCH, JANINE, JANINE2, JanineRematchIntroText, JanineRematchAfterBattleText, FightingDojoJanineSpinMovement

FightingDojoJanineSpinMovement:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end

DojoJanineRematchWinLossText:
	text "!!!"
	line "So so strong!"
	done

dojo_rematch_script Blaine, FIGHTINGDOJO_REMATCH_1, ENGINE_DAILY_BLAINE_REMATCH, BLAINE, BLAINE2, BlaineRematchIntroText, BlaineRematchAfterBattleText

DojoBlaineRematchWinLossText:
	text "BLAINE: You really"
	line "are hot stuff!"
	done

dojo_rematch_script Morty, FIGHTINGDOJO_REMATCH_2, ENGINE_DAILY_MORTY_REMATCH, MORTY, MORTY2, MortyRematchIntroText, MortyRematchAfterBattleText

DojoMortyRematchWinLossText:
	text "I'm still not good"
	line "enough…"
	done

dojo_rematch_script Misty, FIGHTINGDOJO_REMATCH_1, ENGINE_DAILY_MISTY_REMATCH, MISTY, MISTY2, MistyRematchIntroText, MistyRematchAfterBattleText

DojoMistyRematchWinLossText:
	text "MISTY: You really"
	line "are good…"
	done

dojo_rematch_script Jasmine, FIGHTINGDOJO_REMATCH_2, ENGINE_DAILY_JASMINE_REMATCH, JASMINE, JASMINE2, JasmineRematchIntroText, JasmineRematchAfterBattleText

DojoJasmineRematchWinLossText:
	text "Well done…"
	done

dojo_rematch_script Chuck, FIGHTINGDOJO_REMATCH_3, ENGINE_DAILY_CHUCK_REMATCH, CHUCK, CHUCK2, ChuckRematchIntroText, ChuckRematchAfterBattleText

DojoChuckRematchWinLossText:
	text "Wha? Huh?"
	line "I lost?"
	cont "Again?"
	done

dojo_rematch_script Bugsy, FIGHTINGDOJO_REMATCH_1, ENGINE_DAILY_BUGSY_REMATCH, BUGSY, BUGSY2, BugsyRematchIntroText, BugsyRematchAfterBattleText

DojoBugsyRematchWinLossText:
	text "My research must"
	line "not be complete…"
	done

dojo_rematch_script LtSurge, FIGHTINGDOJO_REMATCH_1, ENGINE_DAILY_LTSURGE_REMATCH, LT_SURGE, LT_SURGE2, LtSurgeRematchIntroText, LtSurgeRematchAfterBattleText

DojoLtSurgeRematchWinLossText:
	text "SURGE: Arrrgh!"
	line "You're still just"
	cont "as strong!"
	done

dojo_rematch_script Clair, FIGHTINGDOJO_REMATCH_2, ENGINE_DAILY_CLAIR_REMATCH, CLAIR, CLAIR2, ClairRematchIntroText, ClairRematchAfterBattleText

DojoClairRematchWinLossText:
	text "I lost?"

	para "Again?"
	done

FightingDojoRematch1Script:
	readmem wVariableSprites + SPRITE_DOLL_1 - SPRITE_VARS
	ifequal SPRITE_FALKNER, FightingDojoFalknerScript
	ifequal SPRITE_ERIKA, FightingDojoErikaScript
	ifequal SPRITE_PRYCE, FightingDojoPryceScript
	ifequal SPRITE_BLAINE, FightingDojoBlaineScript
	ifequal SPRITE_MISTY, FightingDojoMistyScript
	ifequal SPRITE_BUGSY, FightingDojoBugsyScript
	ifequal SPRITE_SURGE, FightingDojoLtSurgeScript
	disappear FIGHTINGDOJO_REMATCH_1
	end

FightingDojoRematch2Script:
	readmem wVariableSprites + SPRITE_DOLL_2 - SPRITE_VARS
	ifequal SPRITE_WHITNEY, FightingDojoWhitneyScript
	ifequal SPRITE_SABRINA, FightingDojoSabrinaScript
	ifequal SPRITE_JANINE, FightingDojoJanineScript
	ifequal SPRITE_MORTY, FightingDojoMortyScript
	ifequal SPRITE_JASMINE, FightingDojoJasmineScript
	ifequal SPRITE_CLAIR, FightingDojoClairScript
	disappear FIGHTINGDOJO_REMATCH_2
	end

FightingDojoRematch3Script:
	readmem wVariableSprites + SPRITE_BIG_DOLL - SPRITE_VARS
	ifequal SPRITE_BROCK, FightingDojoBrockScript
	ifequal SPRITE_BLUE, FightingDojoBlueScript
	ifequal SPRITE_CHUCK, FightingDojoChuckScript
	disappear FIGHTINGDOJO_REMATCH_3
	end

FightingDojoBlackBelt:
	faceplayer
	opentext
	writetext FightingDojoBlackBeltText
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

	para "GYM LEADERS from"
	line "KANTO and JOHTO"

	para "come to this"
	line "FIGHTING DOJO"
	cont "to train."
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
	object_event  0,  0, SPRITE_DOLL_1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FightingDojoRematch1Script, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	object_event  0,  0, SPRITE_DOLL_2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FightingDojoRematch2Script, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	object_event  0,  0, SPRITE_BIG_DOLL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FightingDojoRematch3Script, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
