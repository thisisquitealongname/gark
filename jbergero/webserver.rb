require 'webrick'
require './html_presenter.rb'
require './twine_parser.rb'

#create the http server object
server = WEBrick::HTTPServer.new :Port => 8005
trap 'INT' do server.shutdown end

#define how the server will respond to requests
server.mount_proc '/' do |req, res|
  res.body = pageheader +
  "
  <a href='#{Random.rand 9999}'>link to another page</a>
  <br>
  <a href='start'>start</a>
  <br>
  
  <hr>
  
  #{render_page req.meta_vars}
  
  " + 
  pagefooter
end

#the <body /> part of what we'll return
def render_page request_metavars
  
  cheated = !request_metavars['HTTP_REFERER']
    #false if this page was reached by legitimately clicking a link
    #true if a url was typed in manually
  frompage = request_metavars['HTTP_REFERER'][7..-1].partition('/')[2] unless cheated
    #url of the page that sent us here. the leading 'http://domain.com/' has been stripped
  requested_path = request_metavars['PATH_INFO'][1..-1]
    #everything after the first '/' (except http://) of the browser's request
  atthehomepage = requested_path == ''
    #is the user just requesting the base page? we shouldn't accuse them of cheating in this case
    cheated = false if atthehomepage
  
  ret = ''

=begin
  ret << 'we are at '
  ret << requested_path
  ret << 'home' if atthehomepage
  unless cheated
    ret << "<BR> got here from "
    ret << frompage
  else
    ret << "<br>GOT HERE BY CHEATING!!!!!" unless atthehomepage
  end
=end
  
  if cheated then
    #TODO: escort user back to home page or wherever they're supposed to be
    ret << 'you cheater'
  else 
     #ret << (pagebody requested_path)
  end
  ret << (pagebody requested_path)
  
  ret
  
end

server.start
