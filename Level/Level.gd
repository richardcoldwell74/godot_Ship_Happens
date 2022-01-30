extends Node2D

var SharkScene: PackedScene = preload("res://Fish/shark/Shark.tscn")
var CrabScene: PackedScene = preload("res://Fish/crab/Crab.tscn")

var SharkCount: int = 0


func _on_GameTimer_timeout():
	# emits a signal every second that anything that needs timing can listen for
	SignalManager.emit_signal(SignalManager.GAME_TIMER)
	GameManager.GamePlayTime += 1


func _ready() -> void:
	GameManager.Score = 0
	GameManager.BoatHealth = 20
	randomize()
	$Spawners/CrabSpawnTimer.start(rand_range(2, 5))
	$Spawners/SharkSpawnTimer.start(rand_range(3, 6))
	spawn_shark()
	spawn_crab()


func _process(_delta):
	if GameManager.BoatHealth == 0:
		$UI/ShipHealthLabel.text = "SHIP HEALTH: 0" # set ui health to 0 as doesn't update to 0 otherwise
		SignalManager.emit_signal(SignalManager.GAME_OVER)
		


func spawn_shark() -> void:
	SignalManager.emit_signal(SignalManager.SPAWN_SHARK, SharkScene, global_position)


func spawn_crab() -> void:
	SignalManager.emit_signal(SignalManager.SPAWN_CRAB, CrabScene, global_position)


func _on_CrabSpawnTimer_timeout():
	spawn_crab()
	$Spawners/CrabSpawnTimer.start(rand_range(2, 5))


func _on_SharkSpawnTimer_timeout():
	spawn_shark()
	$Spawners/SharkSpawnTimer.start(rand_range(3, 6))


