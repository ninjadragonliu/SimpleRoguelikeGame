extends Node2D

var inside_width : int = 9
var inside_height : int = 9

@onready var Generation : Node

#func _ready():
	#if Generation:
		#generate_interior()
func north():
	$NorthDoor.visible = true
	$NorthWall.queue_free()

func south():
	$SouthDoor.visible = true
	$SouthWall.queue_free()

func east():
	$EastDoor.visible = true
	$EastWall.queue_free()

func west():
	$WestDoor.visible = true
	$WestWall.queue_free()
