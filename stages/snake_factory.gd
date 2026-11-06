class_name SnakeFactory extends Node2D

@export_category("Paramaters")
@export var tail: PackedScene
@export var apple: PackedScene

func create_tail() -> Tail:
	var instance := tail.instantiate() as Tail
	return instance

func create_apple() -> Apple:
	var instance := apple.instantiate() as Apple
	instance.position = _get_random_pos() * GameManager.GRID_SIZE
	return instance

func _get_random_pos() -> Vector2i:
	var x: int = randi_range(-7, 7)
	var y: int = randi_range(-4, 4)
	return Vector2i(x, y)
