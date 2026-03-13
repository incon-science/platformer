extends Node2D
@onready var ground: Sprite2D = $lvl1/ground

@onready var zoomcam: PhantomCamera2D = $zoomcam
@onready var player: Player = %Player
@onready var camoffesetbottom: PhantomCamera2D = $camoffesetbottom
@onready var camoffesetbottom_2: PhantomCamera2D = %camoffesetbottom2


@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var audio_fadeout: AnimationPlayer = $AudioStreamPlayer/audio_fadeout

@onready var canvas_modulate: CanvasModulate = $CanvasModulate

var game_can_begin : bool = false

@onready var lvl_1: Node2D = $lvl1
@onready var lvl_2: Node2D = $lvl2
var lvl_2_loaded:bool = false

func duplicate_room1(offset_x):
	var r = ground.duplicate()
	r.position.x = r.position.x + offset_x 
	r.z_index = r.z_index -1
	$".".add_child(r)  
		
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var len = 0.274 * 13902
	for i in range(6):
		duplicate_room1(i*len)
	ground.hide()
	ground.process_mode = Node.PROCESS_MODE_DISABLED
	
	
	canvas_modulate.hide()
	player.hide()
	player.process_mode = Node.PROCESS_MODE_DISABLED
	
	lvl_2.hide()
	lvl_2.process_mode = Node.PROCESS_MODE_DISABLED

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if player.position.x < -3562:
		audio_fadeout.play("fadoutsong")
	
	if !lvl_2_loaded and player.position.x < -4763:
		lvl_2_loaded = true
		
		lvl_2.show()
		lvl_2.process_mode = Node.PROCESS_MODE_INHERIT
		
		lvl_1.hide()
		lvl_1.process_mode = Node.PROCESS_MODE_DISABLED
		
	
	if player.is_on_floor():
		game_can_begin = true
	
	if !audio_stream_player.playing and game_can_begin:
		audio_stream_player.play()
		
	if player.global_position.y > 5000:
		player.respawn()
	if player.global_position.y > 2000 and player.global_position.x > 13734:
		player.respawn()


func _on_zoom_zone_body_entered(body: Node2D) -> void:
	if body is Player : zoomcam.priority = 10


func _on_zoom_zone_body_exited(body: Node2D) -> void:
	if body is Player : zoomcam.priority = 0


func _on_no_bottom_offset_zone_body_entered(body: Node2D) -> void:
	if body is Player : camoffesetbottom.priority = 10


func _on_no_bottom_offset_zone_body_exited(body: Node2D) -> void:
	if body is Player : 
		camoffesetbottom.priority = 0
		camoffesetbottom_2.priority = 0


func _on_cinematic_animation_finished() -> void:
	canvas_modulate.show()
	player.show()
	player.process_mode = Node.PROCESS_MODE_INHERIT
	





func _on_no_offset_zone_lvl_2_body_entered(body: Node2D) -> void:
	if body is Player : camoffesetbottom.priority = 10


func _on_no_offset_zone_lvl_2_body_exited(body: Node2D) -> void:
	if body is Player : 
		camoffesetbottom.priority = 0
		camoffesetbottom_2.priority = 0
