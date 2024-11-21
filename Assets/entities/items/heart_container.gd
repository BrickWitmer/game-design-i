extends BaseItem

func _init(): super._init(20)

func interact(player):
	player.pickup_heart_container(value)
	remove()
