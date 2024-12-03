extends Control

@onready var player = get_tree().get_first_node_in_group("Player")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.process_mode = Node.PROCESS_MODE_ALWAYS

func _on_resume_pressed() -> void:
	self.hide()
	get_tree().paused = false
	player.data.max_health = 60
	player.data.state = player.STATES.IDLE
	player.data.health = player.data.max_health

func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()
