# soil_spot.gd
extends Area2D

signal tree_planted

@export var tree_scene: PackedScene
var has_tree := false

func _input(event):
	if event.is_action_pressed("ui_accept") and not has_tree:
		for body in get_overlapping_bodies():
			if body.name == "Player" and body.seed_count > 0:
				body.seed_count -= 1
				_plant_tree()
				emit_signal("tree_planted")
				has_tree = true
				break

func _plant_tree():
	var tree = tree_scene.instantiate()
	tree.global_position = global_position
	get_parent().add_child(tree)
