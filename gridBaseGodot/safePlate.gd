extends Node2D


export(String, "safe", "dangerous") var state = "safe"

var dangerousSprite = preload("res://images/dangerousPlate.png")

onready var plateSprite = get_child(0).get_node("Sprite")


signal falling

func get_state():
	return self.state

func _on_safePlateArea_area_entered(area):
	if area.name == "playerArea":
		if state == "dangerous":
			emit_signal("falling")
		else:
			state = "dangerous"
			plateSprite.set_texture(dangerousSprite)
