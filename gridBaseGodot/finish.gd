extends Control

signal switch

func _on_Button_pressed():
	emit_signal("switch")
