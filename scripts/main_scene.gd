extends Node2D

@export var push_force: float = 500.0
@onready var hoop_loops_group: Node2D = $hoop_loops_group
@onready var ui: CanvasLayer = $UI
signal last_circle

var HOOP_LOOP: PackedScene = preload("res://scenes/circle_loop.tscn")
func _on_hoop_loop_spawn_timeout() -> void:
	if $hoop_loops_group.get_child_count() <= 15:
		var hoop_loop_instance = HOOP_LOOP.instantiate()
		$hoop_loops_group.add_child(hoop_loop_instance)
		hoop_loop_instance.position = $hoop_loop_spawn_point.position

func _on_hoop_loops_group_child_entered_tree(node: Node) -> void:
	await node.ready
	if "color_of_hoop" in node:
		var color = node.color_of_hoop
		Globals.active_hoop_colors.append(color)
		#print("Added color:", color)

func _on_hoop_loops_group_child_exiting_tree(node: Node) -> void:
	if "color_of_hoop" in node:
		var color = node.color_of_hoop
		Globals.active_hoop_colors.erase(color)
		Globals.score_total += 1
		ui.update_score()
		print("Removed color:", color)
		if Globals.active_hoop_colors.count(Globals.random_selected_color) == 0:
			print("No hoops left with selected color:", Globals.random_selected_color)
			if $Timer.is_inside_tree():
				$Timer.start()
			else:
				print("Timer not yet in scene tree!")


func _on_timer_timeout() -> void:
	get_tree().paused = false
	if Globals.game_won:
		get_tree().change_scene_to_file("res://scenes/end_scene.tscn")
	else:
		ui.start_countdown()
