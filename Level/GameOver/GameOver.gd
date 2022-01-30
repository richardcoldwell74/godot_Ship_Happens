extends CanvasLayer


func _ready():
	$GameOverText.visible = false
	var _signal_connect = SignalManager.connect(SignalManager.GAME_OVER, self, "_on_game_over")


func _on_game_over() -> void:
	get_tree().paused = true
	$GameOverText.visible = true
	$GameOverTimer.start(4)





func _on_GameOverTimer_timeout():
	print("GO TO MENU")
	var _menu_scene = get_tree().change_scene("res://Menu/Menu.tscn")
