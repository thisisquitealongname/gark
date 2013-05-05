=begin
sex
=end
@hamster_node_list = []
l = @hamster_node_list

l << {
:name => 'Start',
:text => %(It's morning. You want to explore.. but you've chewed all these bars before. You nibble at the same chunk of sawdust you peed on a month ago. Your life is one long, tediuous game of waiting, punctuated by terrifying moments of being swung up into the arms of your owners while they parrot the word "Squiggles". Confinement is second-nature -- it's almost as if you're playing a minor character in your own story.

You're in one of the few places you know.),
:code => '
	$hamster_cage_open = true
	$hamster_cage_destroyed = false
	$cat_location = :bedroom
	$bedroom_occupied = false
	',
:options => [:incage]
}

l << {
:name => 'In Cage',
:text => "You're in your cage. The door is ",
:code => '
	if $hamster_cage_open
	  @text << "open"
	  @options << :exitcage
	else
	  @text << "closed"
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
:options => [:eatpellets, :runonwheel]
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
:location => :bedroom,
:text => "You're in your bedroom.
	
	",
:code => "
	if $jane_location == :bedroom || $larissa_location == :bedroom
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
:location => :hallway,
:text => "You're in the hallway.

",
:code => %^
	if $jane_location == :hallway || $larissa_location == :hallway
		@text << %(Someone's in the hallway!)
		@options << :putbackincage
	else
		if $cat_location == :hallway
			@text << "A cat sits on the untended carpet.
			"
			@options << :runfromcat
		else
			@options << :bedroom << :livingroom
		end
	end
		^,
:options => []
}

l << {
:name => "Put Back In Cage",
:text => %(A hand swoops down and plucks you from the floor. You hear the stilted mnemonic "Squiggles!" as you're carried towards your cage.),
:code => %(
	if $hamster_cage_destroyed
		@text << %[But HA! Your cage lies in shambles on the floor.
		"Squig-GLES! ... CAT!!!"
		
		You're deposited on a table in the bedroom. The giant jailkeeper spirals off in a heated pursuit. Eventually, you hear a faint "Mraww!" and the click of a door.

		The cat is outside.]
		
		@options << :bedroom
		$cat_location = :outside
	else
		@text << %[The hand deposits you unceremoniously into your soiled confines, shutting the door behind.]
		
		@options << :incage
		$hamster_cage_open = false
		),
:options => []
}

l << {
:name => "Eat Pellets",
:text => "Nom nom. You store 6 pellets in your cheek.",
:code => %^
	$hamster_pellets = 6
	if $hamster_cage_open
		@options << :wanderoutofcage
	else
		@options << :stayincage
	end
	^,
:options => []
}

l << {
:name => "Wander Out Of Cage",
:text => %^You wander out of your cage. ^,
:code => %^
	if $cat_location == :bedroom
		@text << "A cat stalks by."
		@options << :leapontocat << :leapawayfromcat
	else
		@options << :bedroom
	end
		^,
:options => []
}

l << {
:name => "Leap Away From Cat",
:text => %^You leap away from the cat and scurry into the middle of the bedroom.^,
:code => %^^,
:options => [:bedroom]
}

l << {
:name => "Leap Onto Cat",
:text => %^You brazenly leap towards the cat. Puff! You land in its fur and cling to its back.

Startled, the cat takes off and runs downstairs, zigzagging through a maze of legs. You fall off, landing on a red rug in a room full of people.

The cat scampers on, disappearing into the kitchen.^,
:code => %^
	$cat_location = :kitchen
	^,
:options => [:livingroom]
}

l << {
:name => "Living Room",
:location => :livingroom,
:text => %^You're in the living room.^,
:code => %^
	if $jane_location == :livingroom || $larissa_location == :livingroom
		@text << "There's someone in the room!"
		@options << :putbackincage
	else
		if $cat_location = :livingroom
			@text << "A cat perks up and stares at you from the sofa."
			@options << :runfromcat << :approachcat
		else
			@options << :kitchen << :hallway
		end
	end
		^,
:options => []
}

l << {
:name => "Run From Cat",
:text => %^^,
:code => %^
#	$hamster_escape = :hallway if $cat_location == :bedroom
#	$hamster_escape = :livingroom if $cat_location == :hallway
#	$hamster_escape = :kitchen if $cat_location == :livingroom
#	$hamster_escape = :kitchenwalls if $cat_location == :kitchen
	
	$hamster_escape = {:bedroom => :hallway, :hallway => :livingroom, :livingroom => :kitchen, :kitchen => :kitchenwalls}[$cat_location]
	
	@text << "You scurry from the bedroom and into the $hamster_escape, dropping a pellet as you go."
	$hamster_pellets = 0 unless $hamster_pellets
	$hamster_pellets -= 1 if $hamster_pellets > 0
	@text << "You now have $hamster_pellets pellets"
	@options << $hamster_escape	
		^,
:options => []
}

l << {
:name => "Kitchen",
:location => :kitchen,
:text => %^You're in the kitchen.^,
:code => %^
	if $jane_location == :kitchen || $larissa_location == :kitchen
		@text << "Someone's in the kitchen!"
		@options << :putbackincage
	else
	end
	^,
:options => []
}

l << {
:name => "Kitchen Walls",
:location => :kitchenwalls,
:text => %^
	Mold and sawdust meet your nose. Prickly fiberglass adheres to your coat. "Squeaks" echo in close proximity. Something metallic brushes your whiskers. Running your teeth across it, the soft nugget nibbles with just the right consistency.

	You've done it. You've discovered the Golden Hamster Pellet! Hampiness will be yours forever.
^,
:code => %^^,
:options => []
}

l << {
:name => 'Explore Bedroom',
:text => %^You fall into a black hole.^,
:code => '',
:options => []
}

l << {
:name => 'Approach Cat',
:text => %^The cat disappears. Bloody hard to sniff out a black hole these days.^,
:code => %^
	$cat_location = :outside
	^,
:options => []
}
