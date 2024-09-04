extends Control

func _on_show_button_pressed() -> void:
	$Label.text = "Hello, world!"


func _on_hide_button_pressed() -> void:
	$Label.text = ""
