extends Control


func _on_btn_calc_pressed() -> void:
	var eggs = int($linEggs.text)
	var dozens = floor(eggs/12)
	var remaining = eggs % 12
	$lblOut.text = "Eggs: " + str(eggs) + \
					"\nDozens: %.2f" % dozens


func _on_btn_clear_pressed() -> void:
	$lblOut.text = ""
	$linEggs.text = ""

func _on_btn_exit_pressed() -> void:
	get_tree().quit()
