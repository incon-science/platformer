extends Node2D

@onready var arm: Arm = $Arm4
var eye_apple_tentacle = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.lvl_name == "lvl_4":
		%player.position = $cube2.position
		$player/Camera2D.position_smoothing_enabled = false
		
	Global.lvl_name = "lvl_2"
	
	$test_roomtxt.text = "another_room "+str(Global.cpt_lvl[Global.lvl_name])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !$player/Camera2D.position_smoothing_enabled:$player/Camera2D.position_smoothing_enabled = true
	
	$TextEntity.text = Global.dict_txt_entity[Global.lvl_name]
	
	
	if $player.position.x > 1927:
		$player/Camera2D.limit_enabled = false
	else : 
		$player/Camera2D.limit_enabled = true
		

	
	if Global.player_apple :
		if %player.position.x > arm.position.x + 256 - 100 : 
			Global.player_apple = false
			
			eye_apple_tentacle = arm.add_eye()
			arm.slowly_add_direction_target(Vector2(42,-34))
			
			Global.dict_txt_entity["lvl_4"] = "plea7se "
			Global.dict_txt_entity["lvl_2"] = "aga2in! "
			
			Global.cpt_feed +=1
