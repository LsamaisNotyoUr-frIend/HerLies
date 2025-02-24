extends RayCast2D
class_name MyRaycast

signal colliding

func _physics_process(delta: float) -> void:
	if self.is_colliding():
		emit_signal("colliding")
