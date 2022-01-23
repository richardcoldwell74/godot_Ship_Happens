extends Area2D

var FisingLineScene: PackedScene = preload("res://Fisherman/FishingLine.tscn")

func _physics_process(delta):
	var cast = Input.is_action_just_pressed("player_cast")
	if cast and !GameManager.FishingLineOnScreen:
		spawn_fishing_line()
	elif cast and GameManager.FishingLineOnScreen:
		$FishingLine.going_down = false




func spawn_fishing_line() -> void:
	var fishing_line: Node2D = FisingLineScene.instance()
	add_child(fishing_line)
	fishing_line.global_position = $LineSpawnPoint.global_position
	GameManager.FishingLineOnScreen=true
