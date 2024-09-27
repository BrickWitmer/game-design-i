extends Control


func _on_btn_calc_pressed() -> void:
	$ItemList.add_item("x         y")
	for x in range(-12,17):
		var y = x**6 - 3*x**5 - 93*x**4 + 87*x**3 + 1596*x**2 - 1380*x - 2800
		$ItemList.add_item(str(x) + "         " + str(y))


func _on_btn_clear_pressed() -> void:
	$ItemList.clear()


func _on_btn_exit_pressed() -> void:
	get_tree().quit()
