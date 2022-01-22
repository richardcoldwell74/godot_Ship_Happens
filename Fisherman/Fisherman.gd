extends Area2D


func _physics_process(delta):
	var cast = Input.is_action_just_pressed("player_cast")
