extends KinematicBody2D

onready var ray = $RayCast2D

var tile_size = 32

var dir = Vector2()

func _ready():
	
	position = position.snapped(Vector2(tile_size, tile_size))
	
func _process(delta):
	
	if !ray.is_colliding():
		position += dir * tile_size
	dir = Vector2.ZERO
	get_input()
	
func get_input():
	if Input.is_action_just_pressed("left"):
		dir = Vector2(-1,0)
	elif Input.is_action_just_pressed("right"):
		dir = Vector2(1,0)
	elif Input.is_action_just_pressed("up"):
		dir = Vector2(0,-1)
	elif Input.is_action_just_pressed("down"):
		dir = Vector2(0,1)
		
	if dir != Vector2.ZERO:
		ray.cast_to = dir * tile_size/2
