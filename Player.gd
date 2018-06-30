extends KinematicBody2D

const SPEED = 500
const UP = Vector2(0,-1)
const GRAVITY = 300
const JUMP_HEIGHT = -500

var motion = Vector2(0,0)

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	if Input.is_action_pressed("ui_left"):
		if motion.x > 0:
			motion.x = 0
		motion.x = -SPEED
		
	elif Input.is_action_pressed("ui_right"):
		if motion.x < 0:
			motion.x = 0
		motion.x = SPEED
		
	if Input.is_action_just_pressed("ui_up") && is_on_floor():
		motion.y += JUMP_HEIGHT
		
	else:
		motion.y += GRAVITY * delta
		motion.x = lerp(motion.x, 0, 0.2)
		
	move_and_slide(motion, UP)
	pass