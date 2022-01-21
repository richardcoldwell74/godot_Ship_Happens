extends Node2D


func _ready():
	var _signal_connect = SignalManager.connect(SignalManager.SPAWN_SHARK, self, "_on_spawn_shark")


func _on_spawn_shark(Shark: PackedScene, Location: Vector2) -> void:
	var shark: Area2D = Shark.instance()
	add_child(shark)
	shark.position = Location
