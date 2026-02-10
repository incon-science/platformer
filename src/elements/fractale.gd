extends RigidBody2D

@onready var touchedsong: AudioStreamPlayer2D = $touchedsong
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $Sprite2D/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		touchedsong.play()
		animation_player.play("disapear")
		



func _on_touchedsong_finished() -> void:
	queue_free()
