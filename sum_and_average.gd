extends Control


func _on_btn_calc_pressed() -> void:
	var Num1 = int($Num1_lin.text)
	var Num2 = int($Num2_lin.text)
	var Num3 = int($Num3_lin.text)
	var Num4 = int($Num4_lin.text)
	var Sum = Num1 + Num2 + Num3 + Num4
	var Aver = Sum / 4
	$lblSum.text = "Sum: " + str(Sum)
	$lblAver.text = "Average: " + str(Aver)


func _on_btn_clear_pressed() -> void:
	$lblSum.text = "Sum: "
	$lblAver.text = "Average: "
	$Num1_lin.text = ""
	$Num2_lin.text = ""
	$Num3_lin.text = ""
	$Num4_lin.text = ""

func _on_btn_quit_pressed() -> void:
	get_tree().quit()
