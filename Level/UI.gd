extends CanvasLayer


func _process(delta):
	#$TextureProgress.value = GameManager.BoatHealth
	$ScoreLabel.text = "SCORE" + str(GameManager.Score)
	$ShipHealthLabel.text = "SHIP HEALTH" + str(GameManager.BoatHealth)
