extends Control


func _on_btn_show_pressed() -> void:
	$listPay.add_item("Hours      Pay")
	for i in range(1,41):
		var P = i * 4
		$listPay.add_item(str(i) + "      " + str(P))


func _on_btn_hide_pressed() -> void:
	$listPay.clear()


func _on_btn_quit_pressed() -> void:
	get_tree().quit()
