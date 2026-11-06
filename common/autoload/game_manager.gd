extends Node

const GRID_SIZE: int = 64

@onready var main: Node2D = $"../Main"
@onready var factory: SnakeFactory = $"../Main/Management/SnakeFactory"

func apple_collected() -> void:
	pass
