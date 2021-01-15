extends Node2D

onready var safePlate = preload("res://safePlate.tscn")

onready var gameTiles = get_node("gameTiles")

onready var finishScreen = preload("res://finish.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("levelClearPlate").connect("level_clear", self, "level_clear")
	
	
	for i in range(gameTiles.get_child_count()):
		gameTiles.get_child(i).connect("falling", self, "falling_in_void")

func falling_in_void():
	print("game over")
	get_tree().reload_current_scene()


func level_clear():
	var clear = true
	for i in range(gameTiles.get_child_count()):
		if gameTiles.get_child(i).get_state() == "safe":
			clear = false
	if clear:
		var inst = finishScreen.instance()
		inst.connect("switch", self, "switch_level")
		add_child(inst)

func switch_level():
	var level = get_tree().get_current_scene().get_name()
	
	if level == "level1":
		get_tree().change_scene("res://level2.tscn")
	elif level == "level2":
		get_tree().change_scene("res://level3.tscn")
	elif level == "level3":
		get_tree().change_scene("res://menu.tscn")
	else:
		print("error")
