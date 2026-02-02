class_name Ball
extends RigidBody2D

var go_teleport = null
var teleporting = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _integrate_forces(state):
	if !teleporting and go_teleport!=null:
		
		teleporting = true
		global_position = go_teleport
		hide()
		set_process(PROCESS_MODE_DISABLED)
		await get_tree().create_timer(0.02).timeout
		show()
		set_process(PROCESS_MODE_INHERIT)
		state.apply_impulse(Vector2(0,-400))
		
		await get_tree().create_timer(0.5).timeout
		teleporting = false
		
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
