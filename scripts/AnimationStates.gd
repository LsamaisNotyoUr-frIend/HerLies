extends States
class_name AnimationStates

@export var character_anim_body: AnimatedSprite3D
@export var character_anim_body_2D: AnimatedSprite2D

enum AnimStates{IDLE, ATTACK, TURNAROUND, RUN, SLIDE}
var current_state: AnimStates = AnimStates.IDLE

func update_states(direction: Vector3):
	pass
