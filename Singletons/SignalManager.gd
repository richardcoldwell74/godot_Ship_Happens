extends Node

signal game_timer
const GAME_TIMER: String = "game_timer"
func game_timer() -> void:
	emit_signal("game_timer")


# to be called when a shark needs spawning
signal spawn_shark(fish, location)
const SPAWN_SHARK: String = "spawn_shark"
func signal_spawn_shark() -> void:
	emit_signal("spawn_shark")


# to be called when a fish needs spawning
signal spawn_crab(fish, location)
const SPAWN_CRAB: String = "spawn_crab"
func signal_spawn_crab() -> void:
	emit_signal("spawn_crab")


# to be called when Fishing Line needs spawning
signal spawn_fishing_line(fishing_line, location)
const SPAWN_FISHING_LINE: String = "spawn_fishing_line"
func spawn_fishing_line() -> void:
	emit_signal("spawn_fishing_line")


# to be called when ship health is 0 to trigger Game Over
signal game_over()
const GAME_OVER: String = "game_over"
func game_over() -> void:
	emit_signal("game_over")

