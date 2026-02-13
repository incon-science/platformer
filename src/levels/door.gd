extends Node2D

@onready var point_light_2d: PointLight2D = $PointLight2D
@onready var point_light_2d_2: PointLight2D = $PointLight2D2
@onready var point_light_2d_3: PointLight2D = $PointLight2D3
@onready var player: Player = %Player
@onready var collision_shape_2d: CollisionShape2D = $StaticBody2D/CollisionShape2D
@onready var sprite: Sprite2D = $sprite
@onready var animation_player: AnimationPlayer = $sprite/AnimationPlayer

var opened = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	"""if Global.nb_fractal == 1:
		point_light_2d.visible = true
	if Global.nb_fractal == 2:
		point_light_2d_2.visible = true
	if Global.nb_fractal == 3:
		point_light_2d_3.visible = true"""
	
	if !opened:
		if player.global_position.x < global_position.x + 400 and Global.nb_fractal ==3 :
			collision_shape_2d.set_deferred("disabled", true)
			animation_player.play("opendoor")
			player.shakecamtimer.start()
			opened= true
