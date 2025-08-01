extends RigidBody2D

var color_of_hoop = ""  
@onready var button: Button = $Button

func _ready() -> void:
	var colors = ["blue", "red", "yellow"]
	color_of_hoop = colors[randi() % colors.size()]  
	var original_tex := button.icon as AtlasTexture
	var atlas_tex := original_tex.duplicate() as AtlasTexture
	button.icon = atlas_tex  
	match color_of_hoop:
		"blue":
			atlas_tex.region = Rect2(Vector2(167, 24), Vector2(60, 60))
		"red":
			atlas_tex.region = Rect2(Vector2(87, 24), Vector2(60, 60))
		"yellow":
			atlas_tex.region = Rect2(Vector2(14, 26), Vector2(60, 60))

func _on_button_button_down() -> void:
	if color_of_hoop == Globals.random_selected_color:
		call_deferred("queue_free")
