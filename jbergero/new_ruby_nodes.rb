@master_node_list = []
l = @master_node_list

l << {
:name => 'your bedroom',
:text => 'you wake up. Yep, this is your room.',
:code => '$awake = true
          $asleep = false',
:options => [:backtobed, :getonwithyourlife]
}

l << {
:name => 'back to bed',
:text => 'You decide to be a lazy asshole today. You do nothing. Not even get out of bed.',
:code => '$asleep = true',
:options => [:endtheday]
}

l << {
:name => 'get on with your life',
:text => 'You decide to get out of bed today. How productive!!! (for you). You end up burnt out at the end of the day though.',
:code => '$awake = false
          $money = 5',
:options => [:endtheday]
}

l << {
:name => 'end the day',
:text => 'Day\'s over.',
:code => '

@text << "but you\'re already sleeping and now well rested" if asleep
@text << "im ritch bich" if money > 3

',
:options => [:end]
}

l << {
:name => '',
:text => '',
:code => '',
:options => []
}
