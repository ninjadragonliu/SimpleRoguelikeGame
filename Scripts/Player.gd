extends CharacterBody2D

func player_input() -> void:
	if Input.is_action_just_pressed("move_right"):
		velocity = Vector2.RIGHT
	elif Input.is_action_just_pressed("move_up"):
		velocity = Vector2.UP
	elif Input.is_action_just_pressed("move_left"):
		velocity = Vector2.LEFT
	elif Input.is_action_just_pressed("move_down"):
		velocity = Vector2.DOWN

func move(direction: Vector2) -> void:
	var space_rid = get_world_2d().space
	var space_state = PhysicsServer2D.space_get_direct_state(space_rid)
	var query = PhysicsRayQueryParameters2D.create(global_position, global_position + Vector2(48, 48) * direction)
	var result = space_state.intersect_ray(query)
