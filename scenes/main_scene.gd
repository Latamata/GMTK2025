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
