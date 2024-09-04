extends Control



func _on_show_button_pressed() -> void:
	$Label.text = "Computer Club"


func _on_clear_button_pressed() -> void:
	$Label.text = ""


func _on_exit_button_pressed() -> void:
	get_tree().quit()
