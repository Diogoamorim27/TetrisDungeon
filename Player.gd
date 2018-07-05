extends KinematicBody2D

const SPEED = 500
const UP = Vector2(0,-1)
const GRAVITY_VEC = Vector2(0, 900)
const JUMP_SPEED = -700
const WALL_JUMP_KICK = 700

var motion = Vector2(0,0)
var on_floor = 0
var on_left_wall = 0
var on_right_wall = 0 
var wall_jump = 0

#func _ready():
	#$RayCast2D.cast_to.y = $Sprite.texture.get_height() / 2
	
	#pass
	
func _process(delta):
	
	# MOVIMENTO #
	# Gravidade
	motion += delta * GRAVITY_VEC
	# Mover
	motion = move_and_slide(motion, UP)
	# Colisão com o chão 
	if $RayCastChao.is_colliding():
		on_floor = 1
		wall_jump = 0
	else:
		on_floor = 0
	# Colisao com as paredes
	if $RayCastParedeEsquerda.is_colliding():
		on_left_wall = 1
	else: 
		on_left_wall = 0
	if $RayCastParedeDireita.is_colliding():
		on_right_wall = 1
	else:
		on_right_wall = 0
		
	# INPUT #
	# Movimento Horizontal
	var target_speed = 0
	if Input.is_action_pressed("ui_left"):
		target_speed += -1
	if Input.is_action_pressed("ui_right"):
		target_speed += 1
		
	target_speed *= SPEED
	motion.x = lerp(motion.x, target_speed, 0.1)
	
	# Pulo e Wall Jump
	if Input.is_action_just_pressed("ui_accept"):
		if on_floor:
			motion.y = JUMP_SPEED
		elif !wall_jump:
			if on_left_wall:
				motion.y = JUMP_SPEED
				#motion.x = -WALL_JUMP_KICK
				wall_jump = 1
			elif on_right_wall:
				motion.y = JUMP_SPEED
				#motion.x = WALL_JUMP_KICK
				wall_jump = 1
	pass