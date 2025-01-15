extends Node2D

@onready var timer = $Timer
@onready var item_scene = preload("res://Final_Project/Items/item_test.tscn")
@onready var offset_position = $offset
@export var offset = Vector2(-16,0)

func _ready() -> void:
	timer.start

func _on_timer_timeout() -> void:
	var item = item_scene.instantiate()
	item.position = item.position + offset
	add_child(item)
	timer.start(1)
