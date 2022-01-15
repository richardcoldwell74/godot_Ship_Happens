extends Node2D


func _on_BreakdownTimer_timeout():
	SignalManager.emit_signal(SignalManager.CHANGE_ENGINE_STATE)
