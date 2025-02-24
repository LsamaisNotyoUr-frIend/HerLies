extends CharacterBody2D
class_name mobs
@export var animated_sprite_2d: AnimatedSprite2D
@export var hurt_box: HurtBox
@export var health: int= 10
@export var raycats: Array[RayCast2D]
var take_damage = false
var timer:float = 0
@export var speed = 15000
var direction: Vector2
var timer_dir: float = 0
var rest_time:float = 0
var resting = false

signal death

func _ready() -> void:
	update_direction()
	hurt_box.enable()
	for raycast in raycats:
		raycast.connect("colliding", Callable(self, "_on_colliding"))
		
	
func _process(delta: float) -> void:
	if timer > 0:
		timer -= delta
		animated_sprite_2d.self_modulate = Color(255, 0, 0)
	elif timer <= 0:
		animated_sprite_2d.self_modulate = Color(1, 1, 1)
		
	if timer_dir <= 0 and !resting:
		rest_time = 1
		resting = true
	elif timer_dir > 0:
		timer_dir -= delta
		
	if rest_time > 0:
		direction = Vector2.ZERO
		rest_time -= delta
	elif rest_time <= 0 and resting:
		update_direction()
		timer_dir = 2.0
		resting = false

		
	if health <= 0:
		animated_sprite_2d.self_modulate = Color(255, 0, 0)
		await get_tree().create_timer(0.5).timeout
		emit_signal("death")
		queue_free()
	
	velocity = direction * speed * delta
	move_and_slide()

func update_direction():
	direction = Vector2(randi_range(-1, 1), randi_range(-1, 1)).normalized()
	
func _on_colliding():
	direction *= -1
	await get_tree().create_timer(0.9)
	update_direction()
	timer_dir = 2.0
	resting = false

func takeDamage(damage):
	health -= damage
	take_damage = true
	timer = 0.5
	
