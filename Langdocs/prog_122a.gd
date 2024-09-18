extends Control


func _on_btn_calc_pressed() -> void:
	$ItemList.add_item("Number    Square    Square Root")
	for i in range(1,51):
		var iSquared = pow(i, 2)
		var iSquareRoot = sqrt(i)
		var line = "%d    %d    %.04f" % [i, iSquared, iSquareRoot]
		$ItemList.add_item(line)


func _on_btn_clear_pressed() -> void:
	$ItemList.clear()


func _on_btn_exit_pressed() -> void:
	get_tree().quit()
