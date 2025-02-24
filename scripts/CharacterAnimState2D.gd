extends AnimationStates
class_name CharacterAnimState2D

var attack_number = 0
@export var hitbox: PlayerHitBox
func update_states_2D(direction: Vector2, is_attacking:bool, attack_no:int):
	if direction == Vector2.ZERO:
		current_state = AnimStates.IDLE
	if direction.y != 0 :
		current_state = AnimStates.RUN
	if direction.x >= 0.01:
		character_anim_body_2D.flip_h = false
		current_state = AnimStates.RUN
	elif direction.x <= -0.01:
		character_anim_body_2D.flip_h = true
		current_state = AnimStates.RUN
	if is_attacking == true:
		current_state = AnimStates.ATTACK
		attack_number = attack_no
		
		
	handle_Animations()

func handle_Animations():
	match current_state:
		AnimStates.IDLE:
			character_anim_body_2D.play("idle")
			hitbox.isActive = false
		AnimStates.RUN:
			character_anim_body_2D.play("run")
			hitbox.isActive = false
		AnimStates.ATTACK:
			character_anim_body_2D.play("attack" + str(attack_number))
			hitbox.isActive = true
	
	
	
	
