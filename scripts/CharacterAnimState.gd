extends AnimationStates
class_name CharacterAnimStates3D

func update_states(direction: Vector3):
	print(direction)
	if direction == Vector3.ZERO:
		current_state = AnimStates.IDLE
	if direction.z != 0:
		current_state = AnimStates.RUN
	if direction.x >= 0.01:
		character_anim_body.flip_h = false
		current_state = AnimStates.RUN
	elif direction.x <= -0.01:
		character_anim_body.flip_h = true
		current_state = AnimStates.RUN
		
		
	handle_Animations()

func handle_Animations():
	match current_state:
		AnimStates.IDLE:
			character_anim_body.play("idle")
		AnimStates.RUN:
			character_anim_body.play("run")
	
	
	
	
	
	
	
