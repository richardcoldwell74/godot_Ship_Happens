extends Node2D


func _ready():
	var _signal_connect = SignalManager.connect(SignalManager.SPAWN_CRAB, self, "_on_spawn_crab")


func _on_spawn_crab(Crab: PackedScene, Location: Vector2) -> void:
	var crab: Area2D = Crab.instance()
	add_child(crab)
	crab.position = Location
