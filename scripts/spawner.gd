extends Area2D
class_name Spawner

var mob_scene = load("res://scenes/mobs_characters.tscn")
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func spawn(number: int):
	for i in range(number):
		var mob = mob_scene.instantiate()
		self.add_child(mob)
		var spawn_position = get_random_point_inside()
		mob.global_position = spawn_position  
		level_manager.add_level_1_enemies(mob)
		
func get_random_point_inside() -> Vector2:
	var shape = collision_shape_2d
	if shape is RectangleShape2D:
		var extents = shape.extents
		var random_x = randf_range(-extents.x, extents.x)
		var random_y = randf_range(-extents.y, extents.y)
		return global_position + Vector2(random_x, random_y)
	return global_position
		
func spawn_level2(number:int):
	for i in range(number):
		var mob = mob_scene.instantiate()
		mob.health = 15
		mob.speed = 20000
		self.add_child(mob)
		var spawn_position = get_random_point_inside()
		mob.global_position = spawn_position  
		level_manager.add_level_1_enemies(mob)

	return global_position
