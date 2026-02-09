extends Node2D
@onready var ground: Sprite2D = $ground
@onready var zoomcam: PhantomCamera2D = $zoomcam
@onready var player: Player = %Player

func duplicate_room1(offset_x):
	var r = ground.duplicate()
	r.position.x = r.position.x + offset_x 
	r.z_index = r.z_index -1
	$".".add_child(r)  
		
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var len = 0.274 * 13902
	for i in range(5):
		duplicate_room1(i*len)
		
	ground.hide()
	ground.process_mode = Node.PROCESS_MODE_DISABLED


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player.global_position.x > 3123 and player.global_position.y >1593 and player.global_position.x < 5260 and player.global_position.y <1956:
		zoomcam.priority = 10
	else :
		zoomcam.priority = 0
