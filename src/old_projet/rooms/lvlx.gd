extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func duplicate_pt(position):
	var r = $platform3.duplicate()
	r.position = position
	$".".add_child(r)  

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("put"):
		duplicate_pt(%player.position)
