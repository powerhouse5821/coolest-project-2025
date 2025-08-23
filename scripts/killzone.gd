extends Area2D
@onready var timer: Timer = $Timer


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.get_node("CollisionShape2D").queue_free()
		Engine.time_scale = 0.5
		print("You died")
		timer.start()


func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().change_scene_to_file("res://Scenes/youdied.tscn")
