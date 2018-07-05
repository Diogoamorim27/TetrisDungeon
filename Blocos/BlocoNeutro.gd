extends Node2D

signal _bateu
var direcao
var pos

func _ready():
	$RayCast2D.cast_to.y = $Sprite.texture.get_height() / 2
	for child in get_parent().get_children():
		$RayCast2D.add_exception(child)
	$RayCast2D.add_exception(get_parent().get_parent().get_child(2)) #obs perguntar sobre "$" pro Tomaz
	connect("_bateu", get_parent(), "_colisao")
	pass

func _physics_process(delta):
	for spawn in get_parent().get_parent().get_child(0).get_children():
		if $RayCast2D.is_colliding() && $RayCast2D.get_collider() != spawn:
			emit_signal("_bateu")
	
	pass