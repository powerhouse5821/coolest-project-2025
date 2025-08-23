extends Button

@onready var animation_player: AnimationPlayer = $"../../Box2/AnimationPlayer"

func _on_pressed() -> void:
	animation_player.play("moveit")
