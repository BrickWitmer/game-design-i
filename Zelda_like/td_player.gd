extends CharacterBody2D

const SPEED = 100.0
const MAX_OBTAINABLE_HEALTH = 400
enum STATES {IDLE=0, DEAD, DAMAGED, ATTACKING, CHARGING}

@export var data = {
	"max_health": 60.0,
	"health": 60.0,
	"money": 0,
	"state": STATES.IDLE,
	"secondaties": []
}


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
	update_animation(direction)
	move_and_slide()
	inertia = inertia.move_toward(Vector2.ZERO, delta * 1000) # Make Inertia Zero
	
	if Input.is_action_just_pressed("ui_cancel"):
		$Camera2D/Pause_menu.show()
		get_tree().paused = true

func update_animation(direction):
	var a_name = "idle_"
	if direction.length() > 0:
		a_name = "walk_"
	if look_direction.x != 0:
		a_name += "side"
		$Animated2dSprite.flip_h = look_direction.x < 0
	elif look_direction.y < 0:
		a_name += "up"
	elif look_direction.y > 0:
		a_name += "down"
	$Animated2dSprite.animation = a_name
	$Animated2dSprite.play()
	pass