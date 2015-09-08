
extends Node

const MIN_DIST_ROCK = 50
const MAX_DIST_ROCK = 100

var distance = 0
var airplane = null
var star = preload("res://resources/stars.xml")
var rock = preload("res://resources/rocks.xml")
var global

func _ready():
	global = get_node("/root/global")
	randomize()
	airplane = get_node("Airplane")
	set_fixed_process(true)

func _fixed_process(delta):
	if global.running:
		calculate_distance()
		generate_rocks()

func calculate_distance():
	distance += 1

func generate_rocks():
	if distance % MIN_DIST_ROCK == 0:
		var r = rock.instance()
		r.set_pos(Vector2(airplane.get_pos().x + 900, 240))
		if randi() % 2:
			r.set_scale(Vector2(1, -1))
		add_child(r)
