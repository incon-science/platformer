extends Area2D
class_name Portal

@export var portal_target:Portal
@export var portal_reverse_color:bool = false
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var point_light_2d: PointLight2D = $PointLight2D

func _ready() -> void:
	if portal_reverse_color :
		point_light_2d.color = "#f0d3ff"
		animated_sprite_2d.play("reverse")
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body is Player :
		if !body.inside_portal:
			body.position = portal_target.global_position 
			body.velocity.y = body.save_velocity.y * -1
			
			body.inside_portal = true
			
			body.hide()
			await get_tree().create_timer(0.02).timeout
			body.show()
			
			await get_tree().create_timer(0.1).timeout
			body.inside_portal = false
	
	if body is Ball :
		body.go_teleport = portal_target.global_position

func _on_no_jump_body_entered(body: Node2D) -> void:
	if body is Player :
		body.inside_nojump_portal = true
		await get_tree().create_timer(0.5).timeout
		body.inside_nojump_portal = false
