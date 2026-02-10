extends Node

var nb_fractal = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("start"):
		#get_tree().reload_current_scene()
		get_tree().change_scene_to_file("res://src/levels/room_blueprint.tscn")
		nb_fractal = 0
