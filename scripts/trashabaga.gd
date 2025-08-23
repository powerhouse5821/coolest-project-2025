extends Area2D
@onready var gamemanagers: Node = %gamemanagers

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		gamemanagers.addscore()
		queue_free()
