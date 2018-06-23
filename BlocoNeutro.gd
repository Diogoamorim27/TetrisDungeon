extends Node2D

var timer

func _ready():
	timer = Timer.new()
	timer.connect("timeout",self,"_on_timer_timeout") 
	#timeout is what says in docs, in signals
	#self is who respond to the callback
	#_on_timer_timeout is the callback, can have any name
	add_child(timer) #to process
	timer.start() #to start
	
	pass

func _process(delta):
	
	pass

func _on_timer_timeout ():
		self.position.y = self.position.y + 64