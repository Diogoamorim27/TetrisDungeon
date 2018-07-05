extends Node2D

var timer

func _ready():
	timer = Timer.new()
	timer.connect("timeout",self,"_on_timer_timeout") 
	add_child(timer) 
	timer.wait_time = 2
	timer.start()
	pass

func _on_timer_timeout():
	self.transform.y -= Vector2(0, 64)
	pass
