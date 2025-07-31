extends Node2D

@export var push_force: float = 500.0

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is RigidBody2D:
		body.apply_central_impulse(Vector2.RIGHT * push_force)

func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if body is RigidBody2D:
		body.apply_central_impulse(Vector2.LEFT * push_force)


func _on_area_2d_3_body_entered(body: Node2D) -> void:
	if body is RigidBody2D:
		body.apply_central_impulse(Vector2.DOWN * push_force)


func _on_area_2d_4_body_entered(body: Node2D) -> void:
	if body is RigidBody2D:
		body.apply_central_impulse(Vector2.UP * push_force)

@onready var rigid_body_2d: RigidBody2D = $RigidBody2D
@onready var rigid_body_2d_2: RigidBody2D = $RigidBody2D2




@onready var areas := [
	$Area2D,
	$Area2D2,
	$Area2D3,
	$Area2D4
]

func _on_button_button_down() -> void:
	get_tree().paused = true

func _on_button_2_button_down() -> void:
	get_tree().paused = false
