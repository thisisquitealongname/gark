def pageheader
  %[
<html !DOCTYPE=html>
<head>
	<title>Gark Loves You</title>
	<script type="text/javascript">
	</script>
	
	<style type="text/css">
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
			
	</style>
</head>
<body>
  ]
end

def pagefooter
  "</body></html>"
end

def pagebody path
  #this is where the magic will happen :3
  
  return 'welcome to a new game of GARK' if path == ''
  
  #find the correct node for shit
  #WIP!
  node = nil
  @master_node_list.each do |x|
    puts ".#{path}. =? .#{x.nodename}."
    next unless path.upcase == x.nodename.upcase
    node = x
    break
  end
  
  return node.text if node
  
  %[
	<span id="mask">

	</span>
		<div id="header">
			<h4>Remember when you were young? The world was wide open, love was just
				around the corner. Remember...? It was great, wasn't it? 
				Man, life used to glow. <br><br> But look at you now. You're not young anymore. 
				You'll never feel wide-eyed again! Unless you play..</h4>
			<h1>Gark's Magical High-School Adventure.</h1>
		</div>
		
		<div id="menu">
			Name: $playername <br>
			Moves: $move <br>
			Items: for each $item in $items... <br>
			<input name="btnReset" type="reset" value="Restart">
		</div>
		<div id="main">
			<div id="story">
			You step out onto the porch. Jane is there, inclined against a fencepost. 
			Smoke twirls away from an ember at the tip of her fingers.
			Her eyes flit across you.
			</div>
			<span class="choice"><a href="meethergaze"> Meet her gaze.</a></span> 
			<span class="choice"><a href="strollpast">Stroll past.</a></span>
		</div>
  ]
  
  
end
