
extends Node2D

var global

func _ready():
	global = get_node("/root/global")

func _on_Button_pressed():
	global.restart = true
