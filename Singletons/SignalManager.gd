extends Node

signal change_engine_state()
const CHANGE_ENGINE_STATE: String = "change_engine_state"
func change_engine_state() ->void:
	emit_signal("change_engine_state")
