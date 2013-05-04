@master_node_list = []

#incomplete object
#just takes in some text arbitrarily for now
class TwineParselet
  
  attr_accessor :my_text
  
  def initialize
    @my_text = ''
  end
  
  #cram another line of .tw text into here
  def cram line
    @my_text << line.strip!
    @my_text << "\n" unless line == ''
  end
  
  #okay... now that we have all our data in my_text, it's time to start parsing
  def wrapup nodelist
    
    #lol lazy (much more work needs to be done in this method)
    nodelist << self 
  end
  
end



File.open("../hamster.txt", "r") do |infile|
  node = TwineParselet.new
  while (line = infile.gets)
    if (line.index "::")
      node.wrapup @master_node_list
      node = TwineParselet.new
    end
    node.cram line
  end
  node.wrapup @master_node_list #srsly ruby? I have to hand this in as an argument because TwineParselet don't know how to touch a global variable?
end
  
@master_node_list.each do |x|
  
  puts x.my_text
  puts
  puts '========'
  puts
  
end
