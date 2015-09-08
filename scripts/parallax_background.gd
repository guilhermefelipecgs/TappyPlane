
extends Node

var toogle = 0
var old_pos = Vector2()
var mirror_x
var parallax_ground
var g1
var g2
var i = 0

func _ready():
	parallax_ground = get_node("ParallaxBackground/Ground")
	g1 = get_node("Ground1")
	g2 = get_node("Ground2")
	mirror_x = parallax_ground.get_mirroring().x
	set_fixed_process(true)

func _fixed_process(delta):
	
	if parallax_ground.get_pos() > old_pos:
		i += 1
		if i > 1:
			if toogle == 0:
				toogle = 1
				g1.set_pos(Vector2(mirror_x * i, g1.get_pos().y))
			else:
				toogle = 0
				g2.set_pos(Vector2(mirror_x * i, g2.get_pos().y))
	
	old_pos = parallax_ground.get_pos()
