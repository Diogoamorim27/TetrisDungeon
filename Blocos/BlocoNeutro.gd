extends Node2D

const TEXTURES = [
"res://Blocos/rock_1/rock_1_10.png",
"res://Blocos/rock_1/rock_1_20.png",
"res://Blocos/rock_1/rock_1_30.png",
"res://Blocos/rock_1/rock_1_40.png",
"res://Blocos/rock_1/rock_1_50.png",
"res://Blocos/rock_1/rock_1_60.png"]
const SPRITE_SCALE = Vector2(0.301887,0.301887)
const HEIGHT_SCALE = 0.301887

signal _bateu
var direcao
var pos
var spawn_points
var texture


func _ready():
	texture = load(TEXTURES[randi() % 6])
	$Sprite.set_texture(texture)
	$Sprite.set_scale(SPRITE_SCALE)
	$RayCast2D.cast_to.y = $Sprite.texture.get_height() * HEIGHT_SCALE / 2
	for child in get_parent().get_children():
		$RayCast2D.add_exception(child)
	for child in get_parent().get_parent().get_children():
		if child.name == "SpawnPoints":
			print("achei")
			$RayCast2D.add_exception(child) #obs perguntar sobre "$" pro Tomaz
	connect("_bateu", get_parent(), "_colisao")
	pass

func _physics_process(delta):
	for spawn in get_parent().get_parent().get_child(0).get_children():
		if $RayCast2D.is_colliding() && $RayCast2D.get_collider() != spawn:
			emit_signal("_bateu")
	
	pass