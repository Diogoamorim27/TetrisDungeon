extends Node2D

var timer
var bateu 
const SPRITE_SIZE = 64

func _ready():
	timer = Timer.new()
	timer.connect("timeout",self,"_on_timer_timeout") 
	timer.wait_time = 0.5
	#timeout is what says in docs, in signals
	#self is who respond to the callback
	#_on_timer_timeout is the callback, can have any name
	add_child(timer) #to process
	timer.start() #to start
	
	pass

func _process(delta):
	pass

func _colisao():
	bateu = 1
	
	
func _on_timer_timeout ():
	if(!bateu):
		_cair() 
	
func _cair():
	self.position.y = self.position.y + SPRITE_SIZE
	