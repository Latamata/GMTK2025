extends CanvasLayer

@onready var selected_circle: Sprite2D = $Control/ColorRect/selected_circle

var color_of_hoop: String = ""

func _ready() -> void:
	random_circle_loop()

func set_circle_region(atlas_tex: AtlasTexture, color: String) -> void:
	match color:
		"blue":
			atlas_tex.region = Rect2(Vector2(167, 24), Vector2(60, 60))
		"red":
			atlas_tex.region = Rect2(Vector2(87, 24), Vector2(60, 60))
		"yellow":
			atlas_tex.region = Rect2(Vector2(14, 26), Vector2(60, 60))

func random_circle_loop():
	var colors = ["blue", "red", "yellow"]
	var random_color = colors[randi() % colors.size()]
	Globals.random_selected_color = random_color
	#print(Globals.random_selected_color)
	var base_tex := selected_circle.texture as AtlasTexture
	var dup_tex := base_tex.duplicate() as AtlasTexture
	set_circle_region(dup_tex, random_color)
	selected_circle.texture = dup_tex
