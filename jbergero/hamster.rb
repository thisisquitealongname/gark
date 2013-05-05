=begin
sex
=end

l << {
:name => 'Start',
:text => %(It's morning. You want to explore.. but you've chewed all these bars before. You nibble at the same chunk of sawdust you peed on a month ago. Your life is one long, tediuous game of waiting, punctuated by terrifying moments of being swung up into the arms of your owners while they parrot the word "Squiggles". Confinement is second-nature -- it's almost as if you're playing a minor character in your own story.

You're in one of the few places you know.),
:code => '
	$hamster_cage_open = true
	$hamster_cage_destroyed = false
	$cat_location = :livingroom
	$bedroom_occupied = false
	',
:options => [:incage]
}

l << {
:name => 'In Cage',
:text => "You're in your cage. The door is ",
:code => '
	if $hamster_cage_open
	  @text << open
	  @options << :exitcage
	else
	  @text << closed
	end
	',
:options => [:stayincage]
}

l << {
:name => 'Exit Cage',
:text => "You scurry out the door. On the last bar, you realize there's nothing stopping your 4 foot descent onto the tile floor. You try to cling onto metal with your hind legs, but it's no use. You plummet.

Ouch. Son of a pellet. You can't move.

Exactly 4 hours and 3 minutes later, a foot descends onto you, splattering you across the tile.",
:code => '',
:options => []
}

l << {
:name => 'Stay In Cage',
:text => "You huddle in the corner of the cage, nibbling on a pellet and staring at your running wheel.

I'd better eat more before venturing out. Wise is the hamster that doesn't starve! ...
Or maybe I'll go for a run. That looks fun.",
:code => '',
:options => [:eatpellets :runonwheel]
}

l << {
:name => "Run On Wheel",
:text => "You hop on, and begin to run.

Suddenly, you feel the wheel loosen and detach from the cage. The wheel hits the bottom of the cage and careens into the side, shifting the entire cage off of its resting place and onto the floor. The plastic bottom shatters.

Mortified and still wheelbound, you continue to run forwards until the wheel hits a wall and falls on its side. You climb out, rattled.",
:code => "$hamster_cage_destroyed = true",
:options => [:bedroom]
}

l << {
:name => "Bedroom",
:text => "You're in your bedroom.
	
	",
:code => "
	if $bedroom_occupied
		@text << %(Someone's in the bedroom!)
		@options << :putbackincage
	else	
		if $cat_location == :bedroom
			@text << 'There is a cat slinking about the room, eyeing you. It makes you uncomfortable.'
			@options << :runfromcat
		else
			@options << :explorebedroom << :hallway
		end	
		
		if $hamster_cage_destroyed
			@text << 'Your cage lies shattered on the floor.'
		elsif $hamster_cage_open
			@text << 'Your cage is open.'
			@options << :returntocage
		end
	end
	",
:options => []
}

l << {
:name => "Return To Cage",
:text => "You scuttle back to your cage!",
:code => "",
:options => [:incage]
}

l << {
:name => "Hallway",
:text => "You're in the hallway.",
:code => "
	if $hallway_occupied
		@text << %(Someone's in the hallway!)
		@options << :putbackincage
		",
:options => []
}

l << {
:name => "Put Back In Cage",
:text => %(A hand swoops down and plucks you from the floor. You hear the stilted mnemonic "Squiggles!" as you're carried towards your cage.),
:code => "",
:options => []
}

l << {
:name => "",
:text => "",
:code => "",
:options => []
}

l << {
:name => "",
:text => "",
:code => "",
:options => []
}

l << {
:name => "",
:text => "",
:code => "",
:options => []
}

l << {
:name => "",
:text => "",
:code => "",
:options => []
}

l << {
:name => "",
:text => "",
:code => "",
:options => []
}

l << {
:name => "",
:text => "",
:code => "",
:options => []
}

l << {
:name => "",
:text => "",
:code => "",
:options => []
}

l << {
:name => "",
:text => "",
:code => "",
:options => []
}

l << {
:name => "",
:text => "",
:code => "",
:options => []
}

l << {
:name => "",
:text => "",
:code => "",
:options => []
}

l << {
:name => "",
:text => "",
:code => "",
:options => []
}

l << {
:name => "",
:text => "",
:code => "",
:options => []
}

l << {
:name => "",
:text => "",
:code => "",
:options => []
}

l << {
:name => "",
:text => "",
:code => "",
:options => []
}

l << {
:name => "",
:text => "",
:code => "",
:options => []
}

l << {
:name => "",
:text => "",
:code => "",
:options => []
}

l << {
:name => "",
:text => "",
:code => "",
:options => []
}

l << {
:name => "",
:text => "",
:code => "",
:options => []
}

l << {
:name => "",
:text => "",
:code => "",
:options => []
}

l << {
:name => "",
:text => "",
:code => "",
:options => []
}

l << {
:name => "",
:text => "",
:code => "",
:options => []
}

