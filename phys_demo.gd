extends Node2D

var Phys_ball = preload("res://phys_ball.tscn")

func _ready() -> void:
	$Panel/GravSlider.value = $Phys_ball.gravity_scale

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		var nball = Phys_ball.instantiate()
		nball.position = event.position
		nball.gravity_scale = $Panel/GravSlider.value
		nball.inertia = float($Panel/txtIn.text)
		nball.linear_velocity = Vector2(float($Panel/txtVelX.text), 
											float($Panel/txtVelY.text))
		add_child(nball)


func _on_grav_slider_value_changed(value: float) -> void:
	for child in get_children():
		if child is RigidBody2D:
			child.gravity_scale = value

func _on_button_pressed() -> void:
	for child in get_children():
		if child is RigidBody2D:
			var force = randi_range(50, 1000)
			child.apply_central_force(Vector2(1,0) * force)



func _on_button_2_pressed() -> void:
	var inertia = float($Panel/txtIn.text)
	var v_x = float($Panel/txtVelX.text)
	var v_y = float($Panel/txtVelY.text)
	var velocity = Vector2(v_x,v_y)
	var accel = velocity / get_physics_process_delta_time()
	for child in get_children():
		if child is RigidBody2D:
			child.inertia = inertia
			child.linear_velocity = velocity
			child.add_constant_force(accel)
