extends Button


func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Lv1.tscn")


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Lv2.tscn")
	

func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/lv3.tscn")
