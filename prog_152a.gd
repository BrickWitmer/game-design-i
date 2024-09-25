extends Control


func _on_btn_show_pressed() -> void:
	for i in range(3, 9670, 3):
		var sum
		$lblSum.text = str(sum)


func _on_btn_clear_pressed() -> void:
	$lblSum.text = ""


func _on_btn_exi_pressed() -> void:
	get_tree().quit()
