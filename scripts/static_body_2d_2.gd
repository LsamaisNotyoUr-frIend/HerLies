extends Area2D

@export var arrorToRightCollider: CollisionShape2D

func _on_body_entered(body: Node2D) -> void:
	self.monitoring = false


func _on_arrow_activator_left_body_entered(body: Node2D) -> void:
	self.monitoring = true


func _on_arrow_to_left_body_entered(body: Node2D) -> void:
	self.monitoring = false
