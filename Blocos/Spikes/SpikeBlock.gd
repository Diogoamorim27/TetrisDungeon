extends Node2D


const SPRITE_SCALE = Vector2(0.301887,0.301887)
const HEIGHT_SCALE = 0.301887

signal _bateu
signal _morte
var direcao
var pos
var spawn_points
var texture
var Ray1
var Ray2
var Ray3
var Ray4


func _ready():
	$Sprite.set_scale(SPRITE_SCALE)
	$SpriteSpike1.set_scale(SPRITE_SCALE)
	$SpriteSpike2.set_scale(SPRITE_SCALE)
	$SpriteSpike3.set_scale(SPRITE_SCALE)
	$SpriteSpike4.set_scale(SPRITE_SCALE)
	$RayCast2D1.cast_to.y = $Sprite.texture.get_height() * HEIGHT_SCALE / 2
	$RayCast2D2.cast_to.y = $Sprite.texture.get_height() * HEIGHT_SCALE / 2
	$RayCast2D3.cast_to.y = $Sprite.texture.get_height() * HEIGHT_SCALE / 2
	$RayCast2D4.cast_to.y = $Sprite.texture.get_height() * HEIGHT_SCALE / 2


	for child in get_parent().get_children():
		$RayCast2D1.add_exception(child)
	for SceneChildren in get_parent().get_parent().get_children():
		if SceneChildren.name == "SpawnPoints":
			for spawn in SceneChildren.get_children():
				$RayCast2D.add_exception(spawn)
	connect("_bateu", get_parent(), "_colisao")
	connect("_morte", get_parent(), "_morrer")
	pass

func _physics_process(delta):

	if $RayCast2D1.is_colliding():
		if $RayCast2D1.get_collider().name == "Player": 
			emit_signal("_morte")
		else:
			$SpriteSpike1.visible = 0
	if $RayCast2D2.is_colliding():
		if $RayCast2D2.get_collider().name == "Player": 
			emit_signal("_morte")
		else:
			$SpriteSpike2.visible = 0
	if $RayCast2D3.is_colliding():
		if $RayCast2D3.get_collider().name == "Player": 
			emit_signal("_morte")
		else:
			$SpriteSpike3.visible = 0
	if $RayCast2D4.is_colliding():
		if $RayCast2D4.get_collider().name == "Player": 
			emit_signal("_morte")
		else:
			$SpriteSpike4.visible = 0

		#if $RayCast2D.is_colliding() && $RayCast2D.get_collider() != spawn:
			#emit_signal("_bateu")

	pass