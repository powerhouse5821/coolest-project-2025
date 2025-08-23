# HUD.gd
extends CanvasLayer

# Assign these nodes in the Godot editor's Inspector tab
@onready var seeds_label = $SeedsLabel
@onready var trees_label = $TreesLabel
@onready var victory_label = $VictoryLabel

func _ready():
	# Hide the victory message at the start
	victory_label.hide()
	update_seed_count(0)

func update_seed_count(count):
	seeds_label.text = "Seeds: %d" % count

func update_tree_count(planted, goal):
	trees_label.text = "Trees Planted: %d / %d" % [planted, goal]

func show_victory_message():
	victory_label.text = "Great work! You planted trees and helped restore nature. Every tree absorbs CO₂ and gives life to our planet."
	victory_label.show()
