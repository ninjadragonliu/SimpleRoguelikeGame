extends Node

var enemies : Array
var player : CharacterBody2D

func _ready():
	player = get_tree().get_nodes_in_group("Player")[0]

func check_enemies() -> void:
	enemies = get_tree().get_nodes_in_group("Enemy")
