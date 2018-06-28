extends Node2D

signal _bateu
var direcao
var pos
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	direcao = Vector2(0,1)
	connect("_bateu", get_parent(), "_colisao")
	pass

func _process(delta):
	pos = self.transform
	pos.origin.y = self.transform.get_origin().y + 64
	
	if (get_child(0).test_move(pos, direcao)):
		emit_signal("_bateu")
		print("bateu")
