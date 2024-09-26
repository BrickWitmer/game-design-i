extends Control

var score = 0

func addPoint(): score += 1
func subPoint(): score -= 1
func reset():  score = 0

func update():
	$lblOut.text = "score: %d" % score

func _on_btn_update_pressed() -> void:
	var choice = $LineEdit.text.to_lower()
	if choice == "add" or choice == "addition":
		addPoint()
	elif choice == "sub" or choice == "subtract":
		subPoint()
	else:
		OS.alert("invalid choice")
	update()


func _on_btn_reset_pressed() -> void:
	reset()
	update()
