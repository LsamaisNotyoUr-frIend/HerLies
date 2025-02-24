extends Area2D

@export var arrowToLeftCollider: CollisionShape2D 


func _on_body_entered(body: Node2D) -> void:
	self.monitoring = false


func _on_arrow_to_right_body_entered(body: Node2D) -> void:
	self.monitoring = false


func _on_arrow_activator_rigth_body_entered(body: Node2D) -> void:
	self.monitoring = true
