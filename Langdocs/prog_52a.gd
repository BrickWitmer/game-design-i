extends Control


func _on_btn_calc_pressed() -> void:
	var Length = int($txtLen.text)
	var Width = int($txtWid.text)
	var Area = Length * Width
	var Perim = 2 * Length + 2 * Width
	$lblArea.text = "Area: " + str(Area)
	$lblPeri.text = "Perimeter: " + str(Perim)
	#str - string (text)
	#int - interger (whole number)
	#float - floating point number (w/ decimal)



func _on_btn_clear_pressed() -> void:
	$lblArea.text = "Area:  "
	$lblPeri.text = "Perimeter: "
	$txtLen.text = ""
	$txtWid.text = ""


func _on_btn_exit_pressed() -> void:
	get_tree().quit()
