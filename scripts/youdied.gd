extends Node2D

	

func _on_button_2_pressed() -> void:
	await get_tree().create_timer(0.2).timeout # Waits for 2 seconds
	get_tree().change_scene_to_file("res://Scenes/leveldisp.tscn")
