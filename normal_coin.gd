extends BaseItem

func _init(): super._init(15)

func interact(player):
	player.pickup_money(value)
	remove()