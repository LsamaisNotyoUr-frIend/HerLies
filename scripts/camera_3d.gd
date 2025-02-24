extends Camera3D

@export var target: Node3D
@export var follow_speed: float = 5.0

func _process(delta):
	global_position.x = lerp(global_position.x, target.position.x, follow_speed/10 * delta)
	global_position.z = lerp(global_position.z, target.position.z, follow_speed/10 * delta)
	
