extends Control


func _on_btn_calc_pressed() -> void:
	for i in range(0,10):
		var column1 = 2 + (i * 2)
		var column2 = column1 + 1
		var column3 = column1 * 2
		var column4 = column1 ** 2
		$ItemList.add_item(str(column1) + "     " + str(column2) + "     " + str(column3) + "      " + str(column4))


func _on_btn_clear_pressed() -> void:
	$ItemList.clear()


func _on_btn_exit_pressed() -> void:
	get_tree().quit()
