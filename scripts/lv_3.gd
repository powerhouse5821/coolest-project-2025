extends Node2D

@export var goal := 8
var trees_planted := 0
var game_ended := false

@onready var player := $Player
@onready var hud := $HUD
@onready var seeds_label := $HUD/SeedsLabel
@onready var trees_label := $HUD/TreesLabel
@onready var victory_label := $HUD/VictoryLabel
@onready var timer_label := $HUD/TimerLabel
@onready var soilspots := $soilspots
@onready var game_timer := $Timer

func _ready():
	update_hud()

	# Connect signals
	for seed in get_tree().get_nodes_in_group("seeds"):
		seed.connect("seed_collected", Callable(self, "_on_seed_collected"))

	for spot in soilspots.get_children():
		spot.connect("tree_planted", Callable(self, "_on_tree_planted"))

	# ⏱️ Connect the game timer timeout signal (without using the editor)
	game_timer.connect("timeout", Callable(self, "_on_GameTimer_timeout"))

	game_timer.start()
	set_process(true)

func _process(delta):
	if not game_ended:
		var time_left = int(game_timer.time_left)
		timer_label.text = " Time: %d" % time_left

func _on_seed_collected():
	update_hud()

func _on_tree_planted():
	if game_ended:
		return

	trees_planted += 1
	update_hud()

	if trees_planted >= goal:
		game_ended = true
		game_timer.stop()
		victory_label.text = " Great work! You planted enough trees!\n(SDG 13 + SDG 15)"
		
		victory_label.show()
		await get_tree().create_timer(4.0).timeout
		get_tree().change_scene_to_file("res://Scenes/lv3done.tscn")
		
func _on_GameTimer_timeout():
	if not game_ended:
		game_ended = true
		victory_label.text = "Time's up! Try again to restore nature."
		victory_label.show()
		await get_tree().create_timer(3.0).timeout
		get_tree().reload_current_scene()

func update_hud():
	seeds_label.text = " Seeds: %d" % player.seed_count
	trees_label.text = " Trees: %d / %d" % [trees_planted, goal]
