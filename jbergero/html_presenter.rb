

require './new_ruby_nodes.rb'
require './hamster.rb'
@master_node_list = @hamster_node_list


class Storyline
  class << self
    def page(name, text="", links={}, &block) #shold this be inside of Storyline??
      @pages = {} if @pages == nil #sets this on whatgever class we're called inside of
      @pages[name] = Page.new
      @pages[name].text = text;
      @pages[name].links = links;
      @pages[name].block = block;
      if links.member? :location
        @pages[name].location = links[:location]
        links.delete :location
      end
    end
  end
  
  attr_accessor :pages
  
  def render(page)
    block
  end
end


class Page
  attr_accessor :text
  attr_accessor :links
  attr_accessor :block
  attr_accessor :location
  
  def render
    paragraphs = []
    paragraphs<<@text;
    
    paragraphs += (Enumerator.new &@block).to_a unless @block == nil
    puts paragraphs.join "\n";
    puts ""
    @links.each_pair do |link, flavour| 
       puts "#{flavour} -> #{link}"
    end
  end
end

def pageheader
  %[
<html !DOCTYPE=html>
<head>
	<title>Gark Loves You</title>
	<script type="text/javascript">
	</script>
	
	<!--style type="text/css">
		html,body{
		margin:0;
		padding:0;
		height:100%;
		border:none;
		}
		body{
			/* make this a randomly selected image */
			background-image: url('girl-fight.jpg');
			}
		.box{
			height: 100%;
		}
		.choice {
			font-weight: bold;
			padding: 6px 10% 6px 10%;
		}
		.mask {
			width:100%;
			height:100%;
			}
		#header {
			border-bottom: 1px solid;
		}
		#menu {
			max-width: 200px;
			width: 35%;
			height: 100%;
			border-right: 1px solid;
			display: inline-block;
			font-weight: bold;
		}
		#main {
			width: 64%;
			display: inline-block;
			vertical-align:top;
		}
		#mask {
			position:fixed;
			height:100%;
			width:100%;
			opacity:0.8;
			filter:alpha(opacity=80%);
			background-image: url('mask.png');
			background-repeat: repeat-x repeat-y;
			z-index: -1;
			}
		#frmPeter {
			height: 100%;
		}
		#story {
			padding-bottom: 10px;
			}
			
	</style-->
</head>
<body>
  ]
end

def pagefooter
  "</body></html>"
end

def pagebody path
  #this is where the magic will happen :3
  
  return 'welcome to a new game of GARK. <a href="yourbedroom">start here</a>' if path == '' #replace this later with what we want the start page to be ('select your character'?)
  
  #find the correct node for shit
  node = find_node path
  return 'unknown node' unless node
   #this exception handling could afford some cleanup
  
  ret = render_node node
  ret << "<hr>"
  
  #ret << "cash = #{$money}"
  
  ret
end

def render_node node
  @text = node[:text].clone
  @options = node[:options].clone
  eval node[:code]
  
  #node body
  ret = @text.gsub "\n", '<br>'
  ret << '<br><br>'
  
  ret << path_links(node)
  
  ret  
end

#spits out html links to the next nodes we can reach
def path_links node
  
  ret = '<ul>'
  @options.each do |opt|
    ret << "<li><a href='#{opt}'>#{find_node(opt.to_s)[:name]}</a></li>"
  end
  ret << "</ul>"
  
  
  
end

def find_node blah
  @master_node_list.each do |x|
    next unless names_match(blah, x[:name])
    return x
  end
  nil
end

#compares two strings, ignoring case and anything non-alphanumeric
#for example "Start room" should match "start_room" and even 'startroom'
def names_match s1, s2
  t1 = ''
  t2 = ''
  s1.each_char do |c|
    t1 << c if c.match /(\d|[a-zA-Z])/
  end
  s2.each_char do |c|
    t2 << c if c.match /(\d|[a-zA-Z])/
  end
  t1.upcase == t2.upcase
end

def twine2html instring
  ret = ''
  instring.each_line do |line|
    if (line.start_with? '<<')
      content = line[2..-4]
      ret << "content: #{content} <br>"
    else
      ret << "<p>#{line}</p>"
    end#if
  end#instring.each
  ret
end#twine2html
















