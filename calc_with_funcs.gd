extends Control

var Equation
var num1
var num2
var Ans

func _on_btn_p_pressed() -> void:
	Equation = "Operation: Add"
	$lblOp.text = Equation


func _on_btn_m_pressed() -> void:
	Equation = "Operation: Subtract"
	$lblOp.text = Equation


func _on_btn_pow_pressed() -> void:
	Equation = "Operation: Power of"
	$lblOp.text = Equation


func _on_btn_mu_pressed() -> void:
	Equation = "Operation: Multiply"
	$lblOp.text = Equation


func _on_btn_div_pressed() -> void:
	Equation = "Operation: Divide"
	$lblOp.text = Equation


func _on_btn_mod_pressed() -> void:
	Equation = "Operation: Mod"
	$lblOp.text = Equation

func _on_btn_eq_pressed() -> void:
	num1 = int($LineEdit.text)
	num2 = int($LineEdit2.text)
	if $lblOp.text == "Operation: Add":
		Ans = float(num1 + num2)
		$lblRe.text = str(float(Ans))
	elif $lblOp.text == "Operation: Subtract":
		Ans = float(num1 - num2)
		$lblRe.text = str(float(Ans))
	elif $lblOp.text == "Operation: Power of":
		Ans = float(num1 ** num2)
		$lblRe.text = str(float(Ans))
	elif $lblOp.text == "Operation: Multiply":
		Ans = float(num1 * num2)
		$lblRe.text = str(float(Ans))
	elif $lblOp.text == "Operation: Divide":
		Ans = float(num1 / num2)
		$lblRe.text = str(float(Ans))
	elif $lblOp.text == "Operation: Mod":
		Ans = float(num1 % num2)
		$lblRe.text = str(float(Ans))
	else:
		OS.alert("Invalid Numbers")
	


func _on_btn_clear_pressed() -> void:
	pass # Replace with function body.


func _on_btn_exit_pressed() -> void:
	get_tree().quit()
