# player.gd
extends CharacterBody2D
@onready var seeds_label: Label = $"../HUD/SeedsLabel"


signal seed_count_changed(new_count)

@export var speed = 200
var seed_count = 0:
	set(value):
		seed_count = value
		emit_signal("seed_count_changed", seed_count)

func _physics_process(delta):
	var direction = Vector2.ZERO
	if Input.is_action_pressed("ui_right"): direction.x += 1
	if Input.is_action_pressed("ui_left"): direction.x -= 1
	if Input.is_action_pressed("ui_up"): direction.y -= 1
	if Input.is_action_pressed("ui_down"): direction.y += 1

	velocity = direction.normalized() * speed
	move_and_slide()

func collect_seed():
	"""Increments the seed count."""
	self.seed_count += 1
	seeds_label.text = "Seeds = " + str(seed_count)

func plant_seed():
	"""Decrements the seed count if the player has seeds and returns success."""
	if seed_count > 0:
		self.seed_count -= 1
		seeds_label.text = "Seeds = " + str(seed_count)
		return true
	return false
