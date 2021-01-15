extends Control


func _on_level_1_button_pressed():
	get_tree().change_scene("res://level1.tscn")


func _on_level_2_button_pressed():
	get_tree().change_scene("res://level2.tscn")
	
func _on_level_3_button_pressed():
	get_tree().change_scene("res://level3.tscn")
