class_name Apple extends Area2D

@export_category("Paramaters")

@export_category("External Dependencies")

@export_group("Node Dependencies")

@export_group("Component Dependencies")

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		GameManager.
		
