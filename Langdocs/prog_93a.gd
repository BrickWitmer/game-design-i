extends Control


func _on_btn_calc_pressed() -> void:
	var KWH = 0
	var Cost
	var Hour = 0.0475
	KWH = int($linKWH.text)
	Cost = KWH * Hour
	var Sur = Cost * .1
	var CityTax = Cost * .03
	var tCost = Sur + CityTax + Cost
	$lblOut.text = "Base Rate " + str(KWH) + " @ $ 0.0475  $ " + str(Cost) + \
	"\nSurcharge         $  %.2f" % Sur  + \
	"\nCityTax           $  %.2f" % CityTax + \
	"\nPay this Amount        $ %.2f" % tCost + \
	"\n If you don't pay in 1 month         $ %.2f" % (tCost * 1.04)


func _on_btn_clear_pressed() -> void:
	$lblOut.text = ""


func _on_btn_exit_pressed() -> void:
	get_tree().quit()
