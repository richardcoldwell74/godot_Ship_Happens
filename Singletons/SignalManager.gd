extends Node

signal game_timer()
const GAME_TIMER: String = "game_timer"
func game_timer() ->void:
	emit_signal("game_timer")
