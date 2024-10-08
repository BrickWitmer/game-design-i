extends RigidBody2D

var speed = 100
var direction = -1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.start()

func _physics_process(delta: float) -> void:
	self.linear_velocity.x = speed * direction
	
	update_animation(direction)

func _on_timer_timeout() -> void:
	direction *= -1

func _on_body_entered(body: Node) -> void:
	if body.name == "plt_player":
		body.queue_free()
		OS.alert("You Died!")
		get_tree().reload_current_scene()
		
@onready var anim = $AnimatedSprite2D
func update_animation(direction):
	if direction != 0:
		anim.play("Walk")
		anim.flip_h = direction < 0 #flip sprite if moving left
	else:
		anim.play("default")
