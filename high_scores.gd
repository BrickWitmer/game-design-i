extends Control

var highscores = [28, 4, 30]

func update_scoreboard():
	$ItemList.clear()
	highscores.sort()
	for index in range(len(highscores)):
		$ItemList.add_item("%d. %d" % [index+1, highscores[index]])

func _ready() -> void:
	update_scoreboard()


func _on_a__btn_pressed() -> void:
	var score = int($LineEdit.text)
	highscores.append(score)
	update_scoreboard()


func _on_r_btn_pressed() -> void:
	var position = int($LineEdit2.text)-1
	highscores.remove_at(position)
	update_scoreboard()
