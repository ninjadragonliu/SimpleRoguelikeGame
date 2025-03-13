extends CanvasLayer

@onready var player : CharacterBody2D = get_tree().get_first_node_in_group("Player")
@onready var Generation : Node = $"../Generation"

func _process(delta: float) -> void:
	$StatBar/Coins.text = str(Global.coins)
	
	# handle key
	if player.has_key:
		$StatBar/KeySprite.modulate = "ffffff"
	else:
		$StatBar/KeySprite.modulate = "ffffff32"
		
	# handle hearts
	match Global.health:
		8:
			$"HealthBar/Heart 1".frame = 2
			$"HealthBar/Heart 2".frame = 2
			$"HealthBar/Heart 3".frame = 2
			$"HealthBar/Heart 4".frame = 2
		7:
			$"HealthBar/Heart 1".frame = 2
			$"HealthBar/Heart 2".frame = 2
			$"HealthBar/Heart 3".frame = 2
			$"HealthBar/Heart 4".frame = 1
		6:
			$"HealthBar/Heart 1".frame = 2
			$"HealthBar/Heart 2".frame = 2
			$"HealthBar/Heart 3".frame = 2
			$"HealthBar/Heart 4".frame = 0
		5:
			$"HealthBar/Heart 1".frame = 2
			$"HealthBar/Heart 2".frame = 2
			$"HealthBar/Heart 3".frame = 1
			$"HealthBar/Heart 4".frame = 0
		4:
			$"HealthBar/Heart 1".frame = 2
			$"HealthBar/Heart 2".frame = 2
			$"HealthBar/Heart 3".frame = 0
			$"HealthBar/Heart 4".frame = 0
		3:
			$"HealthBar/Heart 1".frame = 2
			$"HealthBar/Heart 2".frame = 1
			$"HealthBar/Heart 3".frame = 0
			$"HealthBar/Heart 4".frame = 0
		2:
			$"HealthBar/Heart 1".frame = 2
			$"HealthBar/Heart 2".frame = 0
			$"HealthBar/Heart 3".frame = 0
			$"HealthBar/Heart 4".frame = 0
		1:
			$"HealthBar/Heart 1".frame = 1
			$"HealthBar/Heart 2".frame = 0
			$"HealthBar/Heart 3".frame = 0
			$"HealthBar/Heart 4".frame = 0
		0:
			$"HealthBar/Heart 1".frame = 0
			$"HealthBar/Heart 2".frame = 0
			$"HealthBar/Heart 3".frame = 0
			$"HealthBar/Heart 4".frame = 0
