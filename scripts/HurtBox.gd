class_name HurtBox
extends Area2D
## An Area2D that represents a part of an entity that can be damaged.

## This node manages detecting incoming hits and handling invincibility states.
@export var user:Node2D

## [b]active_enemies[/b] ([i]int[/i]) The number of enemies currently inside the characters Hurtbox
@export var active_enemies:int

## Initializes the HurtBox by disabling its collision layer and connecting the `area_entered` signal to the `processHit` function.
func _ready() -> void:
	collision_layer = 0
	connect("area_entered", Callable(self, "processHit"))
	connect("area_exited", Callable(self, "processExit"))

## Enables the HurtBox for non-player entities by setting the collision mask.
## @param layer: The collision mask layer to set for non-player entities (default is 6).
func enable(layer = 6):
	collision_mask = layer

## Disables the HurtBox by clearing its collision mask.
func disable():
	collision_mask = 0

## Processes an incoming hit by checking if the area is a `Hitbox`.
## @param area: The `Area2D` instance that entered the HurtBox's area.
func processHit(area: Area2D):
	if area is PlayerHitBox:
		active_enemies += 1
		var hitbox = area as PlayerHitBox
		processDamage(hitbox)
	else:
		return
		
func processExit(area: Area2D):
	if area is PlayerHitBox:
		active_enemies = max(active_enemies - 1, 0)

## Processes the damage from a `Hitbox` by calling the `takeDamage()` method on the hitbox's owner if it exists.
## @param hitbox: The `Hitbox` instance from which the damage originates.
func processDamage(hitbox: PlayerHitBox):
	if user.has_method("takeDamage"):
		user.takeDamage(hitbox.damage)
		invincibility(0.4)

## Disables the HurtBox temporarily to create an invincibility effect and then re-enables it after a set duration.
## @param isPlayer: A boolean indicating if the HurtBox belongs to a player (default is true).
## @param time: The duration of the invincibility in seconds (default is 0.1).
func invincibility( time: float = 0.1):
	disable()
	await get_tree().create_timer(time).timeout
	enable()

## Returns the current collision mask of the HurtBox.
## @return: The integer value of the current collision mask.
func getLayer() -> int:
	return collision_mask
