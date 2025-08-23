# seed.gd
extends Area2D

func _on_body_entered(body):
	# Check if the body has the 'collect_seed' method to ensure it's the player
	if body.name == "Player":
		body.collect_seed()
		queue_free() # The seed disappears after collection
