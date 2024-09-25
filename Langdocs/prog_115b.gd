extends Control


func _on_btn_calc_pressed() -> void:
	for i in range(2,37,2):
		$ItemList.add_item(str(i))


func _on_btn_clear_pressed() -> void:
	$ItemList.clear()


func _on_btn_exit_pressed() -> void:
	get_tree().quit()
