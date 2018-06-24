extends Node
const SPRITE_SIZE = 64
const SPRITE_FIRST_POS = 96
const NOME_DE_ARQUIVO_T = "res://T1.tscn"

var spawnPosition
var timer 
var TResource
var T
var spawnPoints


func _ready():
	spawnPoints = $SpawnPoints.get_children()
	timer = Timer.new()
	timer.connect("timeout",self,"_on_timer_timeout") 
	add_child(timer) 
	timer.wait_time = 8
	timer.start()
	TResource = preload(NOME_DE_ARQUIVO_T)
	T = TResource.instance()
	spawnPosition = spawnPoints[randi() % 10].global_position 
	self.add_child(T)
	T.global_position = spawnPosition
	
	
	pass

func _on_timer_timeout():
	T.free()
	randomize()
	T = TResource.instance()
	spawnPosition = spawnPoints[randi() % 10].global_position
	self.add_child(T)
	T.global_position = spawnPosition
	
	
	pass
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
