extends Node2D

signal level_clear

func _on_Area2D_area_entered(area):
	if area.name == "playerArea":
		emit_signal("level_clear")
		
