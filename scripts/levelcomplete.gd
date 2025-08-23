extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		await get_tree().create_timer(1.0).timeout # Waits for 1 second
		get_tree().change_scene_to_file("res://Scenes/done.tscn")
