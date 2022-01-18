extends Node2D


func _on_GameTimer_timeout():
	# emits a signal every second that anything that needs timing can listen for
	SignalManager.emit_signal(SignalManager.GAME_TIMER)
	GameManager.GamePlayTime += 1
