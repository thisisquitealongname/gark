@master_node_list = []

#buggy atm :(
class TwineParselet
  
 # my_text
  
  def initialize
    my_text = ''
  end
  
  #cram another line of .tw text into here
  def cram line
    my_text << line.strip
  end
  
  #okay... now that we have all our data in my_text, it's time to start parsing
  def wrapup mnl
    mnl << self
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
  node.wrapup @master_node_list
end
  
@master_node_list.each do |x|
  
  puts x
  puts
  puts '========'
  puts
  
end
