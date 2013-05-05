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
  #written by kousu, modified by jbergero
  attr_accessor :text
  attr_accessor :links
  attr_accessor :block
  attr_accessor :location
  
  def render
    paragraphs = []
    paragraphs<<@text;
    
    paragraphs += (Enumerator.new &@block).to_a unless @block == nil
    ret = paragraphs.join "<br>";
    ret << "<hr><ul>"
    @links.each_pair do |link, flavour| 
       ret << "<li><a href='#{link}'>#{flavour}</a></li>" "#{flavour} -> #{link}"
    end
    ret << '</ul>'
  end
end

