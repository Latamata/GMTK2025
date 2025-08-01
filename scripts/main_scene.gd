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

func _on_button_button_down() -> void:
	get_tree().paused = true

func _on_button_2_button_down() -> void:
	get_tree().paused = false

var HOOP_LOOP: PackedScene = preload("res://scenes/circle_loop.tscn")
func _on_hoop_loop_spawn_timeout() -> void:
	if $hoop_loops_group.get_child_count() <= 15:
		var hoop_loop_instance = HOOP_LOOP.instantiate()
		$hoop_loops_group.add_child(hoop_loop_instance)
		hoop_loop_instance.position = $hoop_loop_spawn_point.position
