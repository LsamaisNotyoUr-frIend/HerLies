extends CharacterBody3D
class_name Character
@export var speed:int = 50
@export var sprite: AnimatedSprite3D
@export var animStateMachine: CharacterAnimStates3D
var direction : Vector3

func _ready() -> void:
	pass
	
func _physics_process(delta: float) -> void:
	var input = Input.get_vector("left", "right", "up", "down")
	var direction = Vector3(input.x, 0 , input.y).normalized()
	animStateMachine.update_states(direction)
		
	velocity = (direction * speed * delta).normalized()
	move_and_slide()
