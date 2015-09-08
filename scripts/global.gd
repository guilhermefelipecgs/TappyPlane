
extends Node

var running = false
var restart = false
var game_over = false
var camera
var dialog_game_over = preload("res://resources/game_over.xml")

func _ready():
	set_process(true)

func _process(delta):
	if running and game_over:
		camera = get_tree().get_root().get_node("Level/Airplane")
		running = false
		var d = dialog_game_over.instance()
		camera.add_child(d)
	
	if restart:
		get_tree().reload_current_scene()
		running = false
		restart = false
		game_over = false