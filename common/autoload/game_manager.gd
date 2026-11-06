extends Node

const GRID_SIZE: int = 64

@onready var main: Node2D = $"../Main"
@onready var player: Player = $"../Main/Entities/Snake"
@onready var entities: Node2D = $"../Main/Entities/"
@onready var factory: SnakeFactory = $"../Main/Management/SnakeFactory"
@onready var lose_label: Label = $"../Main/Entities/Label"

var score: int = 0

func apple_collected() -> void:
	player.recieve_tail_piece(factory.create_tail())
	score += 1
	entities.add_child(factory.create_apple())

func lose() -> void:
	lose_label.show()
	get_tree().paused = true
