require 'kramdown'


class Storyline
  class << self
    attr_accessor :pages
    
    def page(name, text="", links={}, &block) #shold this be inside of Storyline??
      @pages = {} if @pages == nil #sets this on whatgever class we're called inside of
      @pages[name] = Page.new
      @pages[name].text = text;
      @pages[name].block = block;
      
      if links.kind_of? Hash
        @pages[name].links = links;
        if links.member? :location
          @pages[name].location = links[:location]
          links.delete :location
        end
      elsif links.kind_of? Symbol
          @pages[name].links = { links => "<< Go back"} #hack solution
      end
    end
  
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
    ret = paragraphs.join("\n")
    #ret = Kramdown::Document.new(ret, :auto_ids => false).to_html
    ret << "<hr><ul>"
    @links.each_pair do |link, flavour| 
       flavour = link.to_s unless flavour
       ret << "<li><a href='#{link}'>#{flavour}</a></li>"
    end
    ret << '</ul>'
  end
end

