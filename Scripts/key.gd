extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Sfx.get_child(2).play()
		body.has_key = true
		queue_free()
	
