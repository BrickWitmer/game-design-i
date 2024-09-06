extends Control

func _on_btn_calc_pressed() -> void:
	var Radi = float($linRadius.text)
	var pi = 3.14
	var Area = pi * Radi ** 2
	var Circum = 2 * pi * Radi
	$lblArea.text = "Area: " + str(Area)
	$lblCircum.text = "Circumference: " + str(Circum)

func _on_btn_clear_pressed() -> void:
	$lblArea.text = "Area: "
	$lblCircum.text = "Circumference: "
	$linRadius.text = ""
	var Area = 0
	var Circum = 0

func _on_btn_exit_pressed() -> void:
	get_tree().quit()
