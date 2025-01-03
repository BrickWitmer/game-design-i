extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var gravity_on = true
var double_jump = true


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor() and gravity_on:
		velocity += get_gravity() * delta
	if is_on_floor():
		double_jump = true

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_pressed("ui_accept") and not is_on_floor() and double_jump == true:
		velocity.y = JUMP_VELOCITY / 1.5
		double_jump = false

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	update_animation(direction)
	
	if Input.is_action_just_pressed("ui_home"):
		self.scale *= 2
	if Input.is_action_just_pressed("ui_end"):
		self.scale /= 2
	if Input.is_action_just_pressed("ui_page_up"):
		self.rotation_degrees += 5
	if Input.is_action_just_pressed("ui_page_down"):
		self.rotation_degrees -= 5
	if Input.is_action_just_pressed("ui_text_completion_replace"):  #tab
		self.position.x += 500
	if Input.is_action_just_pressed("ui_text_backspace"):
		self.position.x -= 500
	if Input.is_action_just_pressed("ui_text_toggle_insert_mode"):
		self.position.y += JUMP_VELOCITY / 2.0
	if Input.is_action_just_pressed("ui_text_delete"):
		self.position.y -= JUMP_VELOCITY / 2.0
	if Input.is_action_just_pressed("pause"):
		$Camera2D/Pause_menu.show()
		get_tree().paused = true

	move_and_slide()


@onready var anim = $AnimatedSprite2D
func update_animation(direction):
	if not self.is_on_floor(): #jumping
		anim.play("Jump")
		anim.flip_h = direction < 0
	elif direction != 0:
		anim.play("Walk")
		anim.flip_h = direction < 0 #flip sprite if moving left
	else:
		anim.play("Idle")
