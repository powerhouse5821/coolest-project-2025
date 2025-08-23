extends Button




func _on_pressed() -> void:
	await get_tree().create_timer(0.5).timeout # Waits for 2 seconds
	get_tree().change_scene_to_file("res://Scenes/leveldisp.tscn")
