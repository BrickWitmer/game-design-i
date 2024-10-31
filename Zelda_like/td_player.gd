extends CharacterBody2D


const SPEED = 300.0
var inertia = Vector2()
var look_direction = Vector2.DOWN

func _physics_process(delta: float) -> void:
	var direction = Vector2(
		Input.get_axis("ui_left","ui_right"),
		Input.get_axis("ui_up","ui_down")
	)
	if direction.length() > 0:
		look_direction = direction
		# Scale to 1 to prevent
		direction = direction.normalized()
		velocity = direction * SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED) #Smooth player down to zero speed
	velocity += inertia
	move_and_slide()
	inertia = inertia.move_toward(Vector2.ZERO, delta * 1000) # Make Inertia Zero
	
	if Input.is_action_just_pressed("ui_cancel"):
		$Camera2D/Pause_menu.show()
		get_tree().paused = true
