extends Area2D

var conveyor_dir = Vector2.DOWN
var foundbody: CharacterBody2D = null
var founditem: RigidBody2D = null
var speed = 75

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if foundbody:
		var conveyor_velocity = conveyor_dir * speed
		foundbody.velocity = conveyor_velocity
	if founditem:
		var conveyor_velocity = conveyor_dir * speed
		founditem.linear_velocity = conveyor_velocity
	pass

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		foundbody = body
		print("A")
	if body is RigidBody2D:
		founditem = body
		print("A")
	pass

func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D and body == foundbody:
		foundbody.velocity = Vector2.ZERO
		foundbody = null
		print("B")
	if body is RigidBody2D and body == founditem:
		founditem.linear_velocity += Vector2.ZERO
		founditem = null
		print("B")
	pass

func _on_mouse_entered() -> void:
	if Input.is_action_just_pressed("Rotation"):
		self.rotate(deg_to_rad(90))
