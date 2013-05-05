@jane_node_list = []
l = @jane_node_list

l << {
:name => 'Start',
:location => :bedroom,
:text => %^
	It's morning. You've slept in past the [bell] again.

	Your Dad has already taken your brother [Sam] to school. Your mother, bless her prozac-munching heart, wouldn't deign to bother you. Not anymore. You get up on your own time. If you get up, if there's something good going on.

	You roll over, grunt, unwedge your undies, and fall back asleep, drooling, into your [pillow].
	^,
:code => %^
	^,
:options => [:bell, :sam, :pillow]
}

l << {
:name => 'Bell',
:text => %^The bell at school is a toothless riff snatched from Chuck Berry's ancient surf-pop. Every day you cringe inwardly as it tills the garden of children you're entangled with. You wish it was Timo Räisänen, or Beirut's Gulag Orkestra, or even Bach. You'd never let anyone at school know this, though. Never let any of them know you care.^,
:code => %^^,
:options => [:start]
}

l << {
:name => 'Sam',
:text => %^What a little twerp. He has that wretched hamster he never plays with, except to throw around by its neck.^,
:code => %^^,
:options => [:start]
}

l << {
:name => 'Pillow',
:location => :bedroom,
:text => %^The [sun] shifts 5 degrees and your pillow remains comfortable.^,
:code => %^
	if $hamster_location == :bedroom
		@text << "You hear scurrying. Fuck. You'd better go chase the hamster."
		@options << :chasethehamster
	else
		@text << "The clock ticks."
		@options << :clockticks << :sun
	end
	
	^,
:options => [:sun]
}

l << {
:name => 'Sun',
:text => %^
	You're looking up at the sky. There's a blank expanse all around. You are aware that in microscope view there are blowing fields of wheat below your feet. The sun beads sweat out of you, slowly sucking your life. Purple and green whirlwinds tear the edges of reality apart in the distance. Somewhere, a wall chinks. A Goat on a Pole bounces with firm determination towards nothing.
	Trees rattle in the empty wind.
	You remember your future.
	But you won't, when you wake up.
	^,
:code => %^^,
:options => [:pillow]
}

l << {
:name => 'Clock Ticks',
:text => %^
	It's coming on third period. You decide to roll out of bed, make your daily effortlessly hip sartorial choices, and get out the door. Today: a boring orange tank top, your prefaded, pre-ripped jeans, and your poignantly unbranded headphones. You have flair, you know it, and you are above it. If your blonde curls weren't enough, your natural habit to hold yourself like you're always on the edge of a question would still make the boys fall over themselves around you. Sometimes you indulge them, but mostly you can't stand to step down to their level anymore. They say "I'd like to get to know you" and you hear "I want to trade genetics with you". A few times you've even lost your temper and left them stunned and lost as you tore apart their motivations.

	Sleepily mulling over all this for the umpteenth time, you're caught offguard by the sunlight. It momentarily blinds you.

	The smell of bread wafts from an unknown source. You set off down the street.
	^,
:code => %^^,
:options => [:offdownthestreet]
}

l << {
:name => 'Off Down The Street',
:location => :tamerlane
:text => %^
	Ah, the suburb. The logical end to the harmonious planned utopian communities of the past. Did the community planners and their cookie-cutters know how isolated it would make me feel? These lawnmower alleys alienate people more than any other form of living humans have developed.
	
	Tamerlane Avenue is as nondescript as the other 21 streets in your neighbourhood. You've counted all of them several times over. Guilder Crescent is nearby to the south. Holly Street crosses Tamerlane latitudinally. You reflect that it is ironic that in a suburb, in fact that it has brought it would be is that precisely because of the suburb. You wish you could express this profoundness to someone. Well, Larissa will understand. You smile a bit at the thought.
	
	It's not that you are a slacker, it's just that... you can't bring yourself to care about anything anyone wants you to care about. You would be writing poetry and slitting your wrists...

	...if it wasn't already so fucking overdone.
	^,
:code => %^^,
:options => [:directroutetoschool, :ghetto]
}

l << {
:name => 'Direct Route To School',
:location => :davidroad
:text => %^
	The sun is too hot here, the cars are too loud, and the concrete is too hard. It's not like the plushy, pillowy-soft sidewalk I grew up on. Still, this is the most interesting part of following Yonge Street.
	^,
:code => %^^,
:options => [:school]
}

l << {
:name => 'Ghetto',
:location => :ghetto
:text => %^
	The main drag here is called David Road. You avoid it by cutting off along the polluted, brambly path beside the drainage stream that runs across most of the tiny side roads. Walking by Larissa's house, your head wanders back to the first time you met her.
	^,
:code => %^^,
:options => [:metlarissa, :school]
}

l << {
:name => 'Met Larissa',
:text => %^
	You'd skipped out on last period. The French revolution was sooo last era. You know this stuff was significant at one point in time. You've already read it, already heard it. Sure, you'll forget it some -- but Wikipedia's a decent enough backup, and some history is worth forgetting. 
	
	You live for the moment. And this moment, you're wandering down train tracks, bored, hoping for something to happen. Usually unrewarding; occasionally eventful. The tracks are just far enough away from the suburbs to escape the wafting conflicts of broken families. 
	
	Once you found a bird that had lost its mother in the forest. You took it in and found found an animal rescue shelter that would take it. Another time, you found a dimebag somewhere along the wooden slats. Those were the highlights of Grade 11 -- That is, until one day. The day something wonderful happened.

	Perched on the rusty, graffiti-grazed rail bridge over Yonge St was a girl that made your insides amble. Headphones on, spraycan in hand.
	
	Her name was Larissa. You talked for hours.
	^,
:code => %^^,
:options => [$jane_location]
}

l << {
:name => 'School',
:location => :school
:text => %^
	You make it to school faster than you'd hoped.
	^,
:code => %^^,
:options => [:smokers => "Have a few drags with the kids out front", :class => "Head to class"]
}

l << {
:name => 'Smokers',
:location => :smokers
:text => %^
	Where else are you going to go? You only smoke socially, but it's not like you actually showed up for class. And anyway, you spy Larissa across the pit. She's keeping warm with an ember under a tree. The leaves guide the trails of smoke as they curl down across the sickly butt-peppered grass. Nothing comforts like toxicity.

	Your eyes lock on Larissa. Lovely Larissa. You call her 'issa, like "is a", as in "is a snowflake". Enigmatic Issa -- she flutters; we flutter! She's not Lisa, Adam, Loren or Nick. Better than Tessa, Brian and that boy John who felt you up awkwardly in his friend's closet at a party. Far better. Refrain fell hard from your humdrum heart.

	Larissa lives on the other side, in the low-income sprawl. Neither of you do extra curriculars anymore. You've never had any classes with her, which is why you only [met Larissa] late last year. She's a year older than you -- so are all of your friends. That's your reward for showing off to the teacher in Grade 3.

	When you were younger; when you still cared. Well, when your wants and cares were identifiable. Now you just want to want. Simplicity blooms into drab grey rooms.

	Larissa slinks up to you, flip-flops in hand. Flit-flut.

	"Hey"
	"Hey"

	That's all you have for each other. To the world at large, you're just friends. That's your comfort-zone.
	^,
:code => %^^,
:options => [:metlarissa, :talkabouttheweather, :tobytakeabow, :observeidly]
}

l << {
:name => 'Talk About The Weather',
:text => %^
	Giggling, Larissa grabs your forearm.
	^,
:code => %^^,
:options => [:smokers]
}

l << {
:name => '',
:location => ''
:text => %^^,
:code => %^^,
:options => []
}

l << {
:name => '',
:location => ''
:text => %^^,
:code => %^^,
:options => []
}

l << {
:name => '',
:location => ''
:text => %^^,
:code => %^^,
:options => []
}

l << {
:name => '',
:location => ''
:text => %^^,
:code => %^^,
:options => []
}

l << {
:name => '',
:location => ''
:text => %^^,
:code => %^^,
:options => []
}

l << {
:name => '',
:location => ''
:text => %^^,
:code => %^^,
:options => []
}

l << {
:name => '',
:location => ''
:text => %^^,
:code => %^^,
:options => []
}

l << {
:name => '',
:location => ''
:text => %^^,
:code => %^^,
:options => []
}

l << {
:name => '',
:location => ''
:text => %^^,
:code => %^^,
:options => []
}

l << {
:name => '',
:location => ''
:text => %^^,
:code => %^^,
:options => []
}

l << {
:name => '',
:location => ''
:text => %^^,
:code => %^^,
:options => []
}

l << {
:name => '',
:location => ''
:text => %^^,
:code => %^^,
:options => []
}

l << {
:name => '',
:location => ''
:text => %^^,
:code => %^^,
:options => []
}