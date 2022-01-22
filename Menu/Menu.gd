extends Node2D


var level_scene = preload("res://Level/Level.tscn")


func _ready():
	pass

func _process(_delta) -> void:
	if Input.is_action_just_pressed("play_game"):
		var _scene_change = get_tree().change_scene_to(level_scene)
