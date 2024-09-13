extends Control


func _on_btn_calc_pressed() -> void:
	var eggs = int($linEggs.text)
	var dozens = floor(eggs/12)
	var remaining = eggs % 12


func _on_btn_clear_pressed() -> void:
	pass # Replace with function body.

func _on_btn_exit_pressed() -> void:
	pass # Replace with function body.
