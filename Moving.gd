extends Node2D

@onready var dir = $Area2D/RayCast2D

func _process(delta: float) -> void:
	var orientation = $Area2D/Orientation.global_position
	for Items in get_tree().get_nodes_in_group("Items"):
		if $Area2D.overlaps_body(Items):
			pass
	if Input.is_action_just_pressed("Rotation"):
		self.rotation_degrees += 90
		dir = Vector2(orientation)
		print(Vector2(dir))
