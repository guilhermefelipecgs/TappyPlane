
extends StaticBody2D

func _ready():
	get_node("AnimatedSprite").set_frame(randi() % 4)

func _on_VisibilityNotifier2D_exit_screen():
	queue_free()
