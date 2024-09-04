extends Control


func _on_show_button_pressed() -> void:
	$Coding.text = 'Coding'


func _on_clear_btn_pressed() -> void:
	$Coding.text = ""


func _on_quit_btn_pressed() -> void:
	get_tree().quit()
