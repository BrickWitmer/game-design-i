extends Control

func sayHi():
	print("Hello, World!")

func getArea(Length,Width):
	var area = Length * Width
	return area # send value back out of function

func getPerim(Length: int,Width: int) -> int:
	var Perim = 2 * Length + 2 * Width
	return Perim

func _on_btn_calc_pressed() -> void:
	sayHi()
	var l = int($linLength.text)
	var w = int($linWidth.text)
	var a = getArea(l, w)
	var p = getPerim(l, w)
	$lblOut.text = "Area : %d\nPerimeter: %d" % [a, p]


func _on_btn_clear_pressed() -> void:
	pass # Replace with function body.


func _on_btn_exit_pressed() -> void:
	get_tree().quit()
