
extends Node2D

const SPEED = 400

var global

func _ready():
	global = get_node("/root/global")
	set_process(true)
	set_fixed_process(true)

func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		if not global.game_over:
			global.running = true
			remove_child(get_node("Tap"))

func _fixed_process(delta):
	if not global.game_over:
		set_pos(get_pos() + Vector2(SPEED,0) * delta)
