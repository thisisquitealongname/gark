@master_node_list = []

#incomplete object
#just takes in some text arbitrarily for now
class TwineNode
  
  #public methods to access instance variables
  attr_accessor :my_text, :nodename
  def text#so that we may call node.text instead of node.my_text
    @my_text
  end
  
  def initialize
    @my_text = ''
    @nodename = nil
  end
  
  #cram another line of .tw text into this node
  def cram line
    unless @nodename
      @nodename = line[3..-1].strip
      raise "hell" unless line[0..2] == ':: '
      return
    end
    @my_text << line.strip!
    @my_text << "\n" unless line == ''
  end
  
  #okay... now that we have all our data in my_text, it's time to start parsing
  def wrapup nodelist
    
    #lol lazy (much more work needs to be done in this method)
    nodelist << self unless @nodename == nil
  end
  
end



File.open("../hamster.txt", "r") do |infile|
  node = TwineNode.new
  while (line = infile.gets)
    if (line.start_with? "::")
      node.wrapup @master_node_list
      node = TwineNode.new
    end
    node.cram line
  end
  node.wrapup @master_node_list #srsly ruby? I have to hand this in as an argument because TwineNode don't know how to touch a global variable?
end
  
=begin
@master_node_list.each do |x|
  
  puts x.nodename
  puts
  #puts x.my_text
  puts
  puts '========'
  puts
  
=end
