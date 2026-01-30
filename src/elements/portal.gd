extends Area2D
class_name Portal

@export var portal_target:Portal
@export var portal_reverse_color:bool = false
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var point_light_2d: PointLight2D = $PointLight2D

var exited = true

func _ready() -> void:
	if portal_reverse_color :
		point_light_2d.color = "#f0d3ff"
		animated_sprite_2d.play("reverse")

func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body is Player :
		exited = false
		if !body.is_inside_portal:
			body.is_inside_portal = true 
			body.position = portal_target.position
			body.velocity.y = body.save_velocity.y * -1
							
			body.hide()
			await get_tree().create_timer(0.02).timeout
			body.show()
			

func _on_body_exited(body: Node2D) -> void:
	if body is Player :
		exited = true
		if portal_target.exited :
			body.is_inside_portal = false
			
