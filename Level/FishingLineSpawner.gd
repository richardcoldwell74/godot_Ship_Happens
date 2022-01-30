extends Node2D


func _ready():
	var _signal_connect = SignalManager.connect(SignalManager.SPAWN_FISHING_LINE, self, "_on_spawn_fishing_line")


func _on_spawn_fishing_line(_FishingLine: PackedScene, _Location: Vector2) -> void:
	pass
#	var fishing_line: Node2D = FishingLine.instance()
#	add_child(fishing_line)
#	fishing_line.position = Location
#	GameManager.FishingLineOnScreen=true
