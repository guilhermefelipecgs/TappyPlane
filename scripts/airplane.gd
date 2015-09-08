
extends KinematicBody2D

const G = 20
const MAX_VELOCITY = 10
const ACCEL_Y = -50

var velocity = Vector2()
var global

func _ready():
	global = get_node("/root/global")
	set_fixed_process(true)
	set_process_input(true)

func _fixed_process(delta):
	if global.running:
		movement(delta)
		rotation(delta)
	elif global.game_over:
		get_node("AnimationPlayer").stop()
	check_game_over()

func check_game_over():
	if is_colliding():
		if(get_collision_normal() != Vector2(0, 1)):
			global.game_over = true

func rotation(delta):
	set_rot(-deg2rad(velocity.y*3))

var act = false

func _input(event):
	if event.type == InputEvent.MOUSE_BUTTON:
		if event.pressed:
			act = true
		else:
			act = false
	

func movement(delta):
	if act:
		velocity.y += ACCEL_Y * delta
	
	velocity.y += G * delta
	velocity.y = clamp(velocity.y, -MAX_VELOCITY, MAX_VELOCITY)
	
	move(velocity)

