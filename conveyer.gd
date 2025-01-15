extends Node2D

@export var speed = 50

@onready var ray = $RayCast2D
@onready var orient = $Orient
@onready var item_position = preload("res://Final_Project/Items/item_test.gd")
@onready var item_test: Node2D = $"."
@onready var area_2d: Area2D = $Area2D
var item_test_position = Vector2()


#func R():
	#if Input.is_action_just_pressed("Rotation"):
		#self.rotate(deg_to_rad(90))
		#ray.target_position = Vector2(orient)

#func move_object():
	#for item in get_tree().get_nodes_in_group("Items"):
		#if $Area2D.overlaps_body(item):
			#pass

#func _process(delta: float) -> void:
	#move_object()
	#item_test_position += ray
