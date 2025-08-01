extends Node2D

@export var push_force: float = 500.0
@onready var hoop_loops_group: Node2D = $hoop_loops_group

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

var active_hoop_colors: Array = []
func _on_hoop_loops_group_child_entered_tree(node: Node) -> void:
	await node.ready
	if "color_of_hoop" in node:
		var color = node.color_of_hoop
		active_hoop_colors.append(color)
		print("Added color:", color)

func _on_hoop_loops_group_child_exiting_tree(node: Node) -> void:
	if "color_of_hoop" in node:
		var color = node.color_of_hoop
		active_hoop_colors.erase(color)
		print("Removed color:", color)

		if active_hoop_colors.count(Globals.random_selected_color) == 0:
			print("No hoops left with selected color:", Globals.random_selected_color)
			
			var timer := Timer.new()
			timer.wait_time = 0.2
			timer.one_shot = true
			timer.timeout.connect(func(): get_tree().paused = false)  # Inline lambda
			add_child(timer)
			timer.start()
