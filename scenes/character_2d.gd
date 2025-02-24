extends CharacterBody2D

@export var speed:int = 5000
@export var sprite: AnimatedSprite2D
@export var animStateMachine: CharacterAnimState2D
@export var myhitbox:PlayerHitBox
var speed_value:int 
var direction : Vector2
var is_attacking = false
var attack_no = 0
var timer: float = 0
var combo_timer: float = 1.5
var combo_active:bool = false
var can_attack: bool = true

func _ready() -> void:
	speed_value = speed
	myhitbox.enablePlayer()
	
func _physics_process(delta: float) -> void:
	if timer > 0 and is_attacking:
		timer -= delta
		can_attack = false
	elif  timer <= 0:
		timer = 0
		speed = speed_value
		is_attacking = false
		can_attack = true
		
	if combo_timer > 0 and combo_active:
		combo_timer -= delta
	elif  combo_timer <= 0:
		is_attacking = false
		attack_no = 0
		combo_active = false

	var input = Input.get_vector("left", "right", "up", "down")
	var direction = input.normalized()
	
	var attack_pressed = Input.is_action_just_pressed("attack")
	
	if attack_pressed and !combo_active and can_attack:
		speed = speed_value
		myhitbox.damage = 5
		is_attacking = true
		attack_no = 1
		timer = 0.4
		combo_active = true
		combo_timer = 1.5
		
	elif attack_pressed and combo_active and can_attack:
		speed = speed/3
		myhitbox.damage = 5
		is_attacking = true
		attack_no += 1
		timer = 0.5 + attack_no/10
		combo_timer = 2.0
		if attack_no == 3:
			speed = speed/10
			myhitbox.damage = 10
			timer = 0.9
		
	if attack_no >= 4 and can_attack:
		speed = speed_value
		is_attacking = false
		combo_timer = 0
		combo_active = false
		timer = 0
		attack_no = 0
		can_attack = true
		
	animStateMachine.update_states_2D(direction, is_attacking, attack_no)
	velocity = direction * speed * delta
	move_and_slide()
	
func increase_speed(multiple: int):
	speed *= multiple
	speed_value = speed
	
