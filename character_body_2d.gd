extends CharacterBody2D

var belt_scene = preload("res://Final_Project/transportation_belt.tscn")

const SPEED = 50

func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Vector2(Input.get_axis("ui_left","ui_right"),Input.get_axis("ui_up","ui_down")).normalized()
	if direction:
		velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		var belt = belt_scene.instantiate()
		var position_place = Vector2(get_global_mouse_position())
		belt.position = get_global_mouse_position()

	move_and_slide()
