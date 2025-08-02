extends CanvasLayer

@onready var selected_circle: Sprite2D = $Control/ColorRect/selected_circle
@onready var timout_counter: Timer = $Control/timout_counter

var color_of_hoop: String = ""
func _ready() -> void:
	start_countdown()
func set_circle_region(atlas_tex: AtlasTexture, color: String) -> void:
	match color:
		"blue":
			atlas_tex.region = Rect2(Vector2(167, 24), Vector2(60, 60))
		"red":
			atlas_tex.region = Rect2(Vector2(87, 24), Vector2(60, 60))
		"yellow":
			atlas_tex.region = Rect2(Vector2(14, 26), Vector2(60, 60))

func random_circle_loop():
	#var colors = ["blue", "red", "yellow"]
	var random_color = Globals.active_hoop_colors[randi() % Globals.active_hoop_colors.size()]
	Globals.random_selected_color = random_color
	#print(Globals.random_selected_color)
	var base_tex := selected_circle.texture as AtlasTexture
	var dup_tex := base_tex.duplicate() as AtlasTexture
	set_circle_region(dup_tex, random_color)
	selected_circle.texture = dup_tex

func start_countdown():
	time_left = time_total
	timout_counter.start()
	selected_circle.visible = false

var time_total = 15
var time_left = 0
func _on_timout_counter_timeout() -> void:
	time_left -= 1
	$Control/TImer_UI.text = str(time_left)
	if time_left > 0:
		timout_counter.start()
	else :
		timout_counter.stop()
		random_circle_loop()
		selected_circle.visible = true
		get_tree().paused = true

func update_score():
	$Control/score.text = "Score: " + str(Globals.score_total)
	if Globals.score_total >= 20:
		Globals.game_won = true
