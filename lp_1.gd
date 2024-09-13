extends Control

func _on_btn_calc_pressed() -> void:
	var Copies = int($linCopies.text)
	var Price  = 0.0 # price per copy
	var tcost  = 0.0 # Total cost
	if Copies > 0 and Copies <= 99:
		Price = 0.30
	elif Copies > 99 and Copies <= 499:
		Price = 0.28
	elif Copies > 499 and Copies  <= 749:
		Price = 0.27
	elif Copies > 749 and Copies <= 1000:
		Price = 0.26
	elif Copies > 1000:
		Price = 0.25
	else:
		$lblOut.text = "Invalid # of copies"
		return
	tcost = Price * Copies
	$lblOut.text = "Price per copy: $" + str(Price) + \
					"\nTotal Cost: $%.2f" % tcost
	


func _on_btn_clear_pressed() -> void:
	$linCopies.text = ""
	$lblOut.text = "Price per copy: $" + \
					"\nTotal Cost: $"


func _on_btn_exit_pressed() -> void:
	get_tree().quit()
