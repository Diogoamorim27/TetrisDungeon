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
	
const ARQUIVOS_PECAS_POS_0 = [
	"res://Pecas/I1.tscn",
	"res://Pecas/J1.tscn",
	"res://Pecas/L3.tscn",
	"res://Pecas/O.tscn",
	"res://Pecas/S2.tscn",
	"res://Pecas/T2.tscn",
	"res://Pecas/Z1.tscn",
	]
	
const ARQUIVOS_PECAS_POS_9 = [
	"res://Pecas/I1.tscn",
	"res://Pecas/J3.tscn",
	"res://Pecas/L1.tscn",
	"res://Pecas/T4.tscn",

]
	
const SPAWN_POINTS = 10
const INDEX_I2 = 1

var spawnPosition
var timer 
var TResource
var T
var spawnPoints
var pecaAtual
var pecaAtualRes
var pecaAntiga
var indexPeca
var indexSpawnPosition


func _ready():
	spawnPoints = $SpawnPoints.get_children()
	timer = Timer.new()
	timer.connect("timeout",self,"_on_timer_timeout") 
	add_child(timer) 
	timer.wait_time = 2
	timer.start()
	_spawn_block()
	pass

func _on_timer_timeout():
	_spawn_block()
	pass
	
func _spawn_block():
	pecaAntiga = pecaAtual
	randomize()
	indexSpawnPosition = randi() % SPAWN_POINTS
	randomize()
	if (indexSpawnPosition == 0):
		indexPeca = randi() % 7
		pecaAtualRes= load(ARQUIVOS_PECAS_POS_0[indexPeca])
		print("ola")
	elif (indexSpawnPosition == 9):
		indexPeca = randi() % 4
		pecaAtualRes= load(ARQUIVOS_PECAS_POS_9[indexPeca])
		print("ole")
	else:
		print("olo")
		indexPeca = randi() % 19
		if (indexSpawnPosition == 1  && indexPeca == 1):
			indexSpawnPosition += 1
		if (indexSpawnPosition == 8 && indexPeca == 1):
			indexSpawnPosition -= 1
		pecaAtualRes = load(ARQUIVOS_PECAS[indexPeca])
	spawnPosition = spawnPoints[indexSpawnPosition].global_position
	pecaAtual = pecaAtualRes.instance()
	get_parent().add_child(pecaAtual)
	pecaAtual.global_position = spawnPosition
	
	
	pass
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
