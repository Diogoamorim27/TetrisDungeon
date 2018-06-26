extends Node
const SPRITE_SIZE = 64
const SPRITE_FIRST_POS = 96
const ARQUIVOS_PECAS = [
	"res://Pecas/I1.tscn",
	"res://Pecas/I2.tscn",
	"res://Pecas/J1.tscn",
	"res://Pecas/J2.tscn",
	"res://Pecas/J3.tscn",
	"res://Pecas/J4.tscn",
	"res://Pecas/L1.tscn",
	"res://Pecas/L2.tscn",
	"res://Pecas/L3.tscn",
	"res://Pecas/L4.tscn",
	"res://Pecas/O.tscn",
	"res://Pecas/T1.tscn",
	"res://Pecas/T2.tscn",
	"res://Pecas/T3.tscn",
	"res://Pecas/T4.tscn",
	"res://Pecas/S1.tscn",
	"res://Pecas/S2.tscn",
	"res://Pecas/Z1.tscn",
	"res://Pecas/Z2.tscn"
	]
const NOME_DE_ARQUIVO_T = "res://Pecas/T1.tscn"

var spawnPosition
var timer 
var TResource
var T
var spawnPoints
var pecaAtual
var pecaAntiga


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
	add_child(T)
	T.global_position = spawnPosition
	
	
	pass

func _on_timer_timeout():
	
	pecaAntiga = pecaAtual
	randomize()
	pecaAtual= load(ARQUIVOS_PECAS[randi() % 19]).instance()
	randomize()
	spawnPosition = spawnPoints[randi() % 10].global_position
	get_parent().add_child(pecaAtual)
	pecaAtual.global_position = spawnPosition
	
	
	pass
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
