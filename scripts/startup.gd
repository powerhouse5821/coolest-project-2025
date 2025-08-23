extends TextureButton

# Called when the node enters the scene tree for the first time.
func _input(event):
	if event is InputEventKey and event.pressed and event.keycode == KEY_ENTER:	
		$"../Box/AnimationPlayer".stop()
		await get_tree().create_timer(0.5).timeout # Waits for 2 seconds
		get_tree().change_scene_to_file("res://Scenes/story.tscn")



func _on_pressed() -> void:
	$"../Box/AnimationPlayer".stop()
	await get_tree().create_timer(0.5).timeout # Waits for 2 seconds
	get_tree().change_scene_to_file("res://Scenes/story.tscn")
