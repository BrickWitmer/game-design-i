extends Control


func _on_btn_calc_pressed() -> void:
	var num1 = int($linNum1.text)
	var num2 = int($linNum2.text)
	var Sum = num1 + num2
	var Diff = num1 - num2
	#TODO do product and average
	var Prod = num1 * num2
	var Aver = (num1 * num2) / 2
	var Abs = abs(Diff)
	var Max = 0
	var Min = 0
	if num1 > num2:
		Max = num1
		Min = num2
	else:
		Max = num2
		
	if Max == num1:
		Min = num2
	else:
		Min = num1
	$Output.text = "Sum: " + str(Sum) + \
	"\nDifference: " + str(Diff) + \
	"\nProduct: " + str(Prod) + \
	"\nAbs. Distance: " + str(Abs) + \
	"\nMax: " + str(Max) + \
	"\nMin: " + str(Min)


func _on_btn_clear_pressed() -> void:
	$Output.text = "Sum: " + \
	"\nDifference: " +  \
	"\nProduct: " +  \
	"\nAbs. Distance: " +  \
	"\nMax: " +  \
	"\nMin: "
	$linNum1.text = ""
	$linNum2.text = ""

func _on_btn_exit_pressed() -> void:
	get_tree().quit()
