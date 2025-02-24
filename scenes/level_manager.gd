extends Node2D
class_name LevelManager
@export var campos1: Node2D
@export var campos2: Node2D
@export var camera: Camera2D
@export var spawners: Array[Spawner]
@onready var enemieslv1: Array[CharacterBody2D]
@export var levelTrigger: LevelTrigger
var start_spawn: bool = false
var cash_amount: int = 0
var spawned: bool = false
	
func _physics_process(delta: float) -> void:
	pass
	
func add_level_1_enemies(character: mobs):
	print("in")
	character.connect("death", Callable(self, "on_level_1_death").bind(character))
	enemieslv1.append(character)

func _on_level_trigger_body_entered(body: Node2D) -> void:
	for spawner in spawners:
		spawner.spawn(5)
		
	spawned = true
	
func on_level_1_death(mob:mobs):
	cash_amount += 300
	enemieslv1.erase(mob)


func _on_arrow_to_right_body_entered(body: Node2D) -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(camera, "global_position", campos2.global_position, 1.0)
	start_spawn = true


func _on_arrow_to_left_body_entered(body: Node2D) -> void:
	print("what")
	var tween = get_tree().create_tween()
	tween.tween_property(camera, "global_position", campos1.global_position, 1.0)
	start_spawn = true
