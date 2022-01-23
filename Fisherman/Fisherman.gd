extends Area2D

var FisingLineScene: PackedScene = preload("res://Fisherman/FishingLine.tscn")

func _physics_process(delta):
	var cast = Input.is_action_just_pressed("player_cast")
	if cast and !GameManager.FishingLineOnScreen:
		spawn_fishing_line()
	elif cast and GameManager.FishingLineOnScreen:
		#need to bring hook back up
		pass




func spawn_fishing_line() -> void:
	SignalManager.emit_signal(
			SignalManager.SPAWN_FISHING_LINE, FisingLineScene, $LineSpawnPoint.global_position
		)
