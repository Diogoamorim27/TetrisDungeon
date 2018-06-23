extends Node
const SPRITE_SIZE = 64
const SPRITE_FIRST_POS = 96
const NOME_DE_ARQUIVO_T = "res://T.tscn"

var spawnPosition
var timer 
var TResource
var T


func _ready():
	
	timer = Timer.new()
	timer.connect("timeout",self,"_on_timer_timeout") 
	add_child(timer) 
	timer.wait_time = 8
	timer.start()
	TResource = preload(NOME_DE_ARQUIVO_T)
	T = TResource.instance()
	T.position.y = 64
	spawnPosition = (randi() % 10) * 64 + SPRITE_FIRST_POS
	T.position.x = spawnPosition
	self.add_child(T)
	
	pass

func _on_timer_timeout():
	#T.free()
	randomize()
	T = TResource.instance()
	T.position.y = 64
	spawnPosition = (randi() % 10) * 64 + SPRITE_FIRST_POS
	T.position.x = spawnPosition
	self.add_child(T)
	
	pass
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
