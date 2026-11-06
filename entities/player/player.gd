class_name Player extends Node2D

@export var move_timer: Timer

var move_dir: int = 0

enum MOVE_DIRECTION {UP, DOWN, LEFT, RIGHT}

var currently_moving: MOVE_DIRECTION = MOVE_DIRECTION.RIGHT

var length: int = 0
var tail_tiles: Array[Tail]

var current_pos: Vector2i = Vector2.ZERO
var last_pos: Vector2i = Vector2.ZERO

const GRID_SIZE: int = GameManager.GRID_SIZE

var dir_to_vector_dict: Dictionary[MOVE_DIRECTION, Vector2i] = {
	MOVE_DIRECTION.UP: Vector2i.UP,
	MOVE_DIRECTION.LEFT: Vector2i.LEFT,
	MOVE_DIRECTION.RIGHT: Vector2i.RIGHT,
	MOVE_DIRECTION.DOWN: Vector2i.DOWN,
}
var opposite_dir_dict: Dictionary[MOVE_DIRECTION, MOVE_DIRECTION] = {
	MOVE_DIRECTION.UP: MOVE_DIRECTION.DOWN,
	MOVE_DIRECTION.LEFT: MOVE_DIRECTION.RIGHT,
	MOVE_DIRECTION.RIGHT: MOVE_DIRECTION.LEFT,
	MOVE_DIRECTION.DOWN: MOVE_DIRECTION.UP,
}

func _ready() -> void:
	move_timer.timeout.connect(_on_timer_timout)

func recieve_tail_piece(tail: Tail) -> void:
	tail_tiles.append(tail)
	add_child(tail)
	tail.top_level = true

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left"):
		_change_dir(MOVE_DIRECTION.LEFT)
	elif event.is_action_pressed("right"):
		_change_dir(MOVE_DIRECTION.RIGHT)
	elif event.is_action_pressed("up"):
		_change_dir(MOVE_DIRECTION.UP)
	elif event.is_action_pressed("down"):
		_change_dir(MOVE_DIRECTION.DOWN)

func _change_dir(dir: MOVE_DIRECTION) -> void:
	if dir == opposite_dir_dict[currently_moving]: return
	
	currently_moving = dir

func _on_timer_timout() -> void:
	_move_snake(currently_moving)

func _move_snake(dir: MOVE_DIRECTION) -> void:
	var translate_dir: Vector2i = dir_to_vector_dict[dir]
	last_pos = current_pos
	current_pos += translate_dir
	

	
	for i in range(tail_tiles.size()-1, -1, -1):
		if i != 0:
			tail_tiles[i].grid_pos = tail_tiles[i - 1].grid_pos
		else:
			tail_tiles[i].grid_pos = last_pos
	
	translate(translate_dir * GRID_SIZE)
	for i in tail_tiles.size():
		tail_tiles[i].position = tail_tiles[i].grid_pos * GRID_SIZE
	
	for n in tail_tiles:
		if current_pos == n.grid_pos:
			GameManager.lose()
