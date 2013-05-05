@master_node_list = []
l = @master_node_list

=begin
^this is afaik the only way to do multi-line comments in Ruby. Anyway, that's not the point of this comment...
it's to teach y'all about string delimiters in ruby

'this is a string'
"this is another"
%*and so is this* (where * can be any of: *, (), {}, [], <> )

pretty useful stuff to know. If your string is going to need some of those special characters, just use a different kind of delimiter ;)

=end

#you can omit the " :code => " part completely if you don't have any code that needs to be ran at this node
#:text and :options get loaded into @text and @options respectively when the node is visited. Careful, changes to these variables are permanent

l << {
:name => %[your bedroom],
:text => %(you wake up. Yep, this is your room.),
:code => '$awake = true
          $asleep = false
          $money = 0',
:options => [:backtobed, :getonwithyourlife]
}

l << {
:name => 'back to bed',
:text => 'You decide to be a lazy asshole today. You do nothing. Not even get out of bed.',
:code => %< $asleep = true >,
:options => [:endtheday]
}

l << {
:name => 'get on with your life',
:text => 'You decide to get out of bed today. How productive!!! (for you). You end up burnt out at the end of the day though.',
:code => '$awake = false
          $money += 5',
:options => [:endtheday]
}

l << {
:name => 'end the day',
:text => "Day's over.",
:code => %[
@text << "but you're already sleeping and now well rested" if $asleep
@text << "im ritch bich" if ($money > 3)
],
:options => [:end]
}

l << {
:name => '',
:text => '',
:code => '',
:options => []
}
