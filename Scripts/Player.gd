extends CharacterBody2D

signal player_moved

func _physics_process(delta):
	player_input()
	
func player_input() -> void:
	if Input.is_action_just_pressed("move_right"):
		velocity = Vector2.RIGHT
		move(velocity)
	elif Input.is_action_just_pressed("move_up"):
		velocity = Vector2.UP
		move(velocity)
	elif Input.is_action_just_pressed("move_left"):
		velocity = Vector2.LEFT
		move(velocity)
	elif Input.is_action_just_pressed("move_down"):
		velocity = Vector2.DOWN
		move(velocity)

func move(direction: Vector2) -> void:
	var space_rid = get_world_2d().space
	var space_state = PhysicsServer2D.space_get_direct_state(space_rid)
	var query = PhysicsRayQueryParameters2D.create(global_position, global_position + Vector2(48, 48) * direction)
	var result = space_state.intersect_ray(query)
	
	if result:
		if result.collider.is_in_group("Wall"):
			return
			
	position += 48 * direction
	player_moved.emit()
