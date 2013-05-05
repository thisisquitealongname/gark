require 'webrick'
require './html_presenter.rb'

#create the http server object
server = WEBrick::HTTPServer.new :Port => 8005
trap 'INT' do server.shutdown end

#define how the server will respond to requests
server.mount_proc '/' do |req, res|
  res.body = pageheader +
  "
  <a href='start'>restart</a>
  <hr>
  
  #{render_page_body req.meta_vars}
  
  " + 
  pagefooter
end

#the <body />
def render_page_body request_metavars
  
  cheated = !request_metavars['HTTP_REFERER']
    #false if this page was reached by clicking a link
    #true if a url was typed in manually
  frompage = request_metavars['HTTP_REFERER'][7..-1].partition('/')[2] unless cheated
    #url of the page that sent us here. the leading 'http://domain.com/' has been stripped
  requested_path = request_metavars['PATH_INFO'][1..-1]
    #everything after the first '/' (except http://) of the browser's request
  atthehomepage = requested_path == ''
    #is the user just requesting the base page? we shouldn't accuse them of cheating in this case
    cheated = false if atthehomepage
  
  ret = ''

  if cheated then
    #TODO: escort user back to home page or wherever they're supposed to be
    ret << 'you cheater<hr>'
  else 
     #ret << (pagebody requested_path)
  end
  ret << (pagebody requested_path)
  
  ret
  
end

server.start
