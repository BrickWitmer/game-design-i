extends Control




func _on_btn_exit_pressed() -> void:
	get_tree().quit()



func _on_btn_calc_pressed() -> void:
		var MPH = int($linMPH.text)
		var SpeedLimit = int($linSpeedLimit.text)
		if MPH > SpeedLimit:
			var MilesOver = MPH - SpeedLimit
			var Fine = 20.0 + (MilesOver * 5)
			$lblFineCash.text = "$ %.2f" % Fine
		else:
			$lblFineCash.text = "Not over the speed limit"



func _on_btn_clear_pressed() -> void:
	$linMPH.text = ""
	$linSpeedLimit.text = ""
	$lblFineCash.text = ""
