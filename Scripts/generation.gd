extends Node

@onready var room_scene : PackedScene = load("res://Nodes/room.tscn")

var map_width : int = 7
var map_height : int = 7
var rooms_to_generate : int = 12
var room_count : int = 0
var rooms_instantiated : bool = false
var first_room_pos : Vector2

var map : Array
var room_nodes : Array

func _ready():
	for i in range(map_width):
		map.append([])
		for j in range(map_height):
			map[i].append(false)
	seed(Global.seed)
	generate()
			
func generate() -> void:
	check_room(3, 3, 0, Vector2.ZERO, true)
	instantiate_rooms()
	$"../Player".global_position = (first_room_pos * 816) + Vector2(262, 262)
	
func check_room(x: int, y: int, remaining: int, general_direction: Vector2, first_room: bool = false) -> void:
	if room_count >= rooms_to_generate:
		return
	
	if x < 0 or x > map_width - 1 or y < 0 or y > map_height - 1:
		return
	
	if first_room == false and remaining <= 0:
		return
		
	if map[x][y] == true:
		return
		
	if first_room:
		first_room_pos = Vector2(x, y)
	
	room_count += 1
	map[x][y] = true
	
	var north : bool = randf() > (0.2 if general_direction == Vector2.UP else 0.8)
	var south : bool = randf() > (0.2 if general_direction == Vector2.DOWN else 0.8)
	var east : bool = randf() > (0.2 if general_direction == Vector2.RIGHT else 0.8)
	var west : bool = randf() > (0.2 if general_direction == Vector2.LEFT else 0.8)
	
	var max_remaining : int = rooms_to_generate
	
	if north or first_room:
		check_room(x, y + 1, max_remaining if first_room else remaining - 1, Vector2.UP if first_room else general_direction)
	if south or first_room:
		check_room(x, y - 1, max_remaining if first_room else remaining - 1, Vector2.DOWN if first_room else general_direction)
	if east or first_room:
		check_room(x + 1, y, max_remaining if first_room else remaining - 1, Vector2.RIGHT if first_room else general_direction)
	if west or first_room:
		check_room(x - 1, y, max_remaining if first_room else remaining - 1, Vector2.LEFT if first_room else general_direction)

func instantiate_rooms() -> void:
	if rooms_instantiated:
		return
	rooms_instantiated = true

	for x in range(map_width):
		for y in range(map_height):
			if map[x][y] == false:
				continue
			
			var room = room_scene.instantiate()
			room.position = Vector2(x, y) * 816
			
			if y > 0 and map[x][y - 1] == true:
				room.north()
			if y < map_height - 1 and map[x][y + 1] == true:
				room.south()
			if x > 0 and map[x - 1][y] == true:
				room.west()
			if x < map_width - 1 and map[x + 1][y] == true:
				room.east()
				
			if first_room_pos != Vector2(x, y):
				room.Generation = self
				
			$"..".call_deferred("add_child", room)
			room_nodes.append(room)
