extends Node2D

var linear = self.linear_velocity

func _physics_process(delta: float) -> void:
	if linear > Vector2(0, 0):
		linear = move_toward(linear, 0, delta)
