extends Sprite2D
@onready var player: CharacterBody2D = $Player
func _ready():
	scale = Vector2(0.2, 0.2)
	var tween = get_tree().create_tween()
	tween.tween_property(self, "scale", Vector2(0.8, 0.8), 2.0).set_trans(Tween.TRANS_SINE)
