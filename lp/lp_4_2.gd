extends Control


func _on_btn_calc_pressed() -> void:
	var KG = int($linWeight.text)
	var H = int($linHeight.text)
	var W = int($linWidth.text)
	var L = int($linLength.text)
	var Dim = H * L * W
	if Dim > 100000:
		$lblOut.text = "Too large"
	elif KG > 27:
		$lblOut.text = "Too heavy"
	elif Dim > 100000 && KG > 27:
		$lblOut.text = "Too heavy and too large"
	else:
		$lblOut.text = "Right Size and Weight"
		
func _on_btn_clear_pressed() -> void:
	$linHeight.text = ""
	$linLength.text = ""
	$linWeight.text = ""
	$linWidth.text = ""
	$lblOut.text = ""


func _on_btn_exit_pressed() -> void:
	get_tree().quit()
