extends Node

var timer 
var nomeDeArquivoT = "res://T.tscn"
var TResource
var T

func _ready():
	timer = Timer.new()
	timer.connect("timeout",self,"_on_timer_timeout") 
	add_child(timer) 
	TResource = load(nomeDeArquivoT)
	T = TResource.instance()
	T.position.x = 544
	T.position.y = 64
	self.add_child(T)
	pass

func _on_timer_timeout():
	
	
	pass
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
