extends RigidBody2D


var color_of_hoop = "blue"  

@onready var button: Button = $Button

func _ready() -> void:
	var colors = ["blue", "red", "yellow"]
	color_of_hoop = colors[randi() % colors.size()]  
	var atlas_tex := button.icon as AtlasTexture
	match color_of_hoop:
		"blue":
			atlas_tex.region = Rect2(Vector2(170, 24), Vector2(60, 60))
		"red":
			atlas_tex.region = Rect2(Vector2(87, 24), Vector2(60, 60))
		"yellow":
			atlas_tex.region = Rect2(Vector2(14, 26), Vector2(60, 60))

func _on_button_button_down() -> void:
	print(color_of_hoop)
	queue_free()
