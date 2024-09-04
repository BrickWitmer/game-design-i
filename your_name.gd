extends Control


func _on_show_button_pressed() -> void:
	$Name.text = "Brick"


func _on_clear_button_pressed() -> void:
	$Name.text = ""


func _on_exit_button_pressed() -> void:
	get_tree().quit()
