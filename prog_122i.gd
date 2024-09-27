extends Control


func _on_btn_calc_pressed() -> void:
	$ItemList.add_item("Number         Cube Root        Cube")
	for i in range(-25,26):
		var iCub = i**3
		var iCubR = pow(abs(i), float(1)/float(3))
		if i < 0:
			iCubR = -1 * iCubR
		var line = "%d            %.05f           %d" % [i,iCubR,iCub]
		$ItemList.add_item(line)


func _on_btn_clear_pressed() -> void:
	$ItemList.clear()


func _on_btn_exit_pressed() -> void:
	get_tree().quit()
