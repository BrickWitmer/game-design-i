extends Control



func _on_btn_calc_pressed() -> void:
	$ItemList.add_item("Number")
	#range(stop)
	#range(start, stop)
	#range(start, stop, step)
	for i in range(2,37,2):
		var line = str(i)
		$ItemList.add_item(line)


func _on_btn_clear_pressed() -> void:
	$ItemList.clear()


func _on_btn_exit_pressed() -> void:
	get_tree().quit()
