extends Area2D

@export var push_force: float = 500.0

@export var push_direction: Vector2 

func _on_body_entered(body: Node2D) -> void:
	if body is RigidBody2D:
		body.apply_central_impulse(push_direction.normalized() * push_force)
