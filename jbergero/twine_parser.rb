class TwineParselet
  
  
  
  #cram another line of .tw text into here
  def cram line
    
  end
  
  
end



File.open("./gark/hamster.txt", "r") do |infile|
  node = TwineParselet.new
  while (line = infile.gets)
    node = TwineParselet.new if line.index "::"
    node.cram line
  end
end
  
