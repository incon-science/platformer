extends Area2D
class_name Portal

@export var portal_target:Portal

var exited = true

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	body.show()
	if body is Player :
		print("enter")
		print(position)
		if exited and portal_target.exited :
			body.position = portal_target.position
			body.velocity.y =-1000
			#body.hide()
			
			exited = false

func _on_body_exited(body: Node2D) -> void:
	if body is Player :
		exited = true
		print("exit")
		print(position)
