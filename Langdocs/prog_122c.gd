extends Control


func _on_btn_calc_pressed() -> void:
	for i in range(0,5):
		var column1 = 2 + (i * 2)
		var column2 = 3 + (i * 2)
		var column3 = 4 + (i * 4)
		var column4 = 4 + (i * )
		$ItemList.add_item(str(column1) + "     " + str(column2) + "     " + str(column3))


func _on_btn_clear_pressed() -> void:
	$ItemList.clear()


func _on_btn_exit_pressed() -> void:
	get_tree().quit()
