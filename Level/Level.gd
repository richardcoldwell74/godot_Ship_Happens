extends Node2D

var SharkScene: PackedScene = preload("res://Fish/shark/Shark.tscn")
var CrabScene: PackedScene = preload("res://Fish/crab/Crab.tscn")

var SharkCount: int = 0


func _on_GameTimer_timeout():
	# emits a signal every second that anything that needs timing can listen for
	SignalManager.emit_signal(SignalManager.GAME_TIMER)
	GameManager.GamePlayTime += 1

func _ready() -> void:
	spawn_shark()
	spawn_crab()

func _process(delta):
	pass


func spawn_shark() -> void:
	SignalManager.emit_signal(
			SignalManager.SPAWN_SHARK, SharkScene, global_position
		)


func spawn_crab() -> void:
	SignalManager.emit_signal(
			SignalManager.SPAWN_CRAB, CrabScene, global_position
		)
