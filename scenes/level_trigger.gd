extends Area2D
class_name LevelTrigger


@export var level_trigger_shape: CollisionShape2D

func _physics_process(delta: float) -> void:
	if level_manager.spawned == true:
		self.monitoring = false
		level_trigger_shape.disabled = true
	if level_manager.enemieslv1.size() == 0:
		self.monitoring = true
		level_trigger_shape.disabled = false
