;Players calls the Dojo
DojoPhoneCalleeScript:
	checktime MORN
	iftrue .morngreet
	checktime DAY
	iftrue .daygreet
	farwritetext DojoPhoneNiteGreetingText
	sjump .getweekday
	;sjump .main

.morngreet
	farwritetext DojoPhoneMornGreetingText
	sjump .getweekday
	;sjump .main

.daygreet
	farwritetext DojoPhoneDayGreetingText
	sjump .getweekday
	;sjump .main

;.main
	;promptbutton - covered in getweekday
	;farwritetext DojoPhoneGenericText - handled in day of week script
	;sjump .hangup - handled in day of week script

.getweekday
	readvar VAR_WEEKDAY
	ifequal SUNDAY,    .Sunday
    ifequal MONDAY,    .Monday
    ifequal TUESDAY,   .Tuesday
    ifequal WEDNESDAY, .Wednesday
    ifequal THURSDAY,  .Thursday
    ifequal FRIDAY,    .Friday
    ifequal SATURDAY,  .Saturday
    sjump .hangup

.Sunday
	checkflag ENGINE_DAILY_CLAIR_REMATCH
	iftrue .hangup
	gettrainername STRING_BUFFER_3, CLAIR, CLAIR2
	promptbutton
	farwritetext DojoPhoneGenericText
	sjump .hangup	

.Monday
	checkflag ENGINE_DAILY_FALKNER_REMATCH
	iftrue .hangup
	gettrainername STRING_BUFFER_3, FALKNER, FALKNER2
	promptbutton
	farwritetext DojoPhoneGenericText
	sjump .hangup

.Tuesday
	checkflag ENGINE_DAILY_BUGSY_REMATCH
	iftrue .hangup
	gettrainername STRING_BUFFER_3, BUGSY, BUGSY2
	promptbutton
	farwritetext DojoPhoneGenericText
	sjump .hangup

.Wednesday
	checkflag ENGINE_DAILY_JASMINE_REMATCH
	iftrue .hangup
	gettrainername STRING_BUFFER_3, JASMINE, JASMINE2
	promptbutton
	farwritetext DojoPhoneGenericText
	sjump .hangup

.Thursday
	checkflag ENGINE_DAILY_WHITNEY_REMATCH
	iftrue .hangup
	gettrainername STRING_BUFFER_3, WHITNEY, WHITNEY2
	promptbutton
	farwritetext DojoPhoneGenericText
	sjump .hangup

.Friday
	checkflag ENGINE_DAILY_CHUCK_REMATCH
	iftrue .hangup
	gettrainername STRING_BUFFER_3, CHUCK, CHUCK2
	promptbutton
	farwritetext DojoPhoneGenericText
	sjump .hangup

.Saturday
    checkflag ENGINE_DAILY_PRYCE_REMATCH
    iftrue .PryceBeaten
    checkflag ENGINE_DAILY_MORTY_REMATCH
    iftrue .OnlyPryceAvailable
    gettrainername STRING_BUFFER_3, PRYCE, PRYCE2
    gettrainername STRING_BUFFER_4, MORTY, MORTY2
    promptbutton
	farwritetext DojoPhoneGenericText2 ; "Pryce and Morty are ready!"
    sjump .hangup

.PryceBeaten:
    checkflag ENGINE_DAILY_MORTY_REMATCH
    iftrue .hangup
    gettrainername STRING_BUFFER_3, MORTY, MORTY2
    promptbutton
	farwritetext DojoPhoneGenericText ; "Morty is ready!"
    sjump .hangup

.OnlyPryceAvailable:
    gettrainername STRING_BUFFER_3, PRYCE, PRYCE2
    promptbutton
	farwritetext DojoPhoneGenericText ; "Pryce is ready!"
    sjump .hangup

.hangup:
	promptbutton
	checktime MORN
	iftrue .mornbye
	checktime DAY
	iftrue .daybye
	farwritetext DojoPhoneHangUpNightText
	end

.mornbye
	farwritetext DojoPhoneHangUpMornText
	end

.daybye
	farwritetext DojoPhoneHangUpDayText
	end