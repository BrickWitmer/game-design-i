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
var attack_direction = look_direction
var animation_lock = 0.0
var damage_lock = 0
var charge_time = 2.5
var charge_start_time = 0

var slash_scene = \
preload("res://Assets/entities/attacks/slash.tscn")
var damage_shader = \
preload("res://Assets/Shaders/take_damage.tres")
var attack_sound = preload("res://Assets/Sounds/slash.wav")
var charge = preload("res://Assets/Shaders/Charge.tres")
var pick_up = preload("res://Assets/Sounds/pickupCoin.wav")
var death_sound = preload("res://Assets/Sounds/synth.wav")
var hurt_sound = preload("res://Assets/Sounds/hitHurt.wav")
var charge_sound = preload("res://Assets/Sounds/synth (1).wav")

@onready var p_HUD = get_tree().get_first_node_in_group("HUD")
@onready var aud_player = $AudioStreamPlayer2D

func get_direction_name():
	return ["right","down","left","up"][
		int(round(look_direction.angle() * 2 / PI)) % 4
	]

func attack():
	data.state = STATES.ATTACKING
	var dir_name = get_direction_name()
	if dir_name == "left":
		$Animated2dSprite.flip_h = 0
	$Animated2dSprite.play("swipe_" + dir_name)
	attack_direction = look_direction
	var slash = slash_scene.instantiate()
	
	slash.position = attack_direction * 20.0
	slash.rotation = Vector2().angle_to_point(-attack_direction)
	add_child(slash)
	aud_player.stream = attack_sound
	aud_player.play()
	animation_lock = 0.2

func charged_attack():
	data.state = STATES.ATTACKING
	$Animated2dSprite.play("swipe_charge")
	attack_direction = -look_direction
	damage_lock = 0.3
	for i in range(9):
		# offset by (i-4) * 45 degrees; [-4,4]
		var angle = attack_direction.angle() + (i-4) * PI/4
		var dir = Vector2(cos(angle), sin(angle))
		var slash = slash_scene.instantiate()
		slash.position = dir * 20
		slash.rotation = Vector2().angle_to_point(-dir)
		slash.damage *= 1.5
		add_child(slash)
		
		await get_tree().create_timer(0.03)
	animation_lock = 0.2
	await $Animated2dSprite.animation_finished
	data.state = STATES.IDLE

func _ready() -> void:
	p_HUD.show()

func pickup_health(value):
	data.health += value
	data.health = clamp(data.health, 0, data.max_health)

func pickup_money(value):
	data.money += value

func pickup_heart_container(value):
	data.max_health += value
	data.max_health = clampf(data.max_health,60,MAX_OBTAINABLE_HEALTH)
	p_HUD.draw_hearts()
	data.health = data.max_health

signal health_depleted

func take_damage(dmg):
	if damage_lock == 0:
		data.health -= dmg
		data.state = STATES.DAMAGED
		damage_lock = 0.5
		animation_lock = dmg * 0.005
		$Animated2dSprite.material = damage_shader.duplicate()
		$Animated2dSprite.material.set_shader_parameter("intensity", 0.5)
		if data.health > 0:
			
			pass
		else:
			data.state = STATES.DEAD
			aud_player.stream = death_sound
			aud_player.play()
			await get_tree().create_timer(0.5).timeout
			health_depleted.emit()
		
	pass

func _physics_process(delta: float) -> void:
	animation_lock = max(animation_lock-delta, 0.0)
	damage_lock = max(damage_lock-delta, 0.0)
	
	if animation_lock == 0 and data.state != STATES.DEAD:
		if data.state == STATES.DAMAGED or max(damage_lock-delta, 0.0 ):
			aud_player.stream = hurt_sound
			aud_player.play()
			$Animated2dSprite.material = null
		
		if data.state != STATES.CHARGING:
			data.state = STATES.IDLE
	
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
		
	if data.state != STATES.DEAD:
		if Input.is_action_just_pressed("ui_accept"):
			attack()
			charge_start_time = 0.0
			data.state = STATES.CHARGING
		charge_start_time += delta
		if Input.is_action_just_released("ui_accept"):
			if charge_start_time >= charge_time and \
			data.state == STATES.CHARGING:
				charged_attack()
			else:
				data.state = STATES.IDLE
		if Input.is_action_just_pressed("ui_select"):
			for entity in get_tree().get_nodes_in_group("Interactables"):
				if entity.in_range(self):
					entity.interact(self)
					data.state = STATES.IDLE
					return

	if Input.is_action_just_pressed("ui_cancel"):
		$Camera2D/Pause_menu.show()
		get_tree().paused = true
	pass

func update_animation(direction):
	var a_name = "idle_"
	if data.state == STATES.IDLE:
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
