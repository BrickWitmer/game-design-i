extends Control

var Equation
var num1 = int($LineEdit.text)
var num2 = int($LineEdit2.text)
var Ans

func myAdd(num1, num2):
	Equation = "Add"
	Ans = num1 + num2
func myMul(num1,num2):
	Equation = "Multiply"
	Ans =num1 * num2
func mySub(num1,num2):
	Equation = "Subtract"
	Ans = num1 - num2
func myPower(num1,num2):
	Equation = "Power"
	Ans = num1 ** num2
func myDivide(num1,num2):
	Equation = "Divide"
	Ans = num1 / num2
func mod(num1,num2):
	Equation = "Mod"
	Ans = num1 % num2

func _on_btn_eq_pressed() -> void:
	if $btnP.pressed:
		myAdd(num1,num2)
	if $btnM.pressed:
		mySub(num1,num2)
	if $btnMu.pressed:
		myMul(num1,num2)
	if $btnDiv.pressed:
		myDivide(num1,num2)
	if $btnMod.pressed:
		mod(num1,num2)
	$lblOp2.text = str(Ans)
